<?php

/**
 * EBayJiraManager is used to get Jira Issues from REST API call
 */

class EBayJiraManager {

		const JIRA_TABLE_CLASS = 'jira-table';
		
    private static $serviceUrl;
    private static $domainUrl;
    private static $tableFields = array(
        'T' ,
        'Key',
        'P',
        'Summary',
        //'Assignee',
        //'Reporter',
        'Status',
        'Created',
        'Updated'
    );

    private static function getServiceUrl() {
        $serviceAPI = libraries_get_path('raptorcms', FALSE) . '/core/Configuration.php';
        require_once ($serviceAPI);
        if (self::$serviceUrl == NULL) {
            self::$serviceUrl = RaptorCMSConfiguration::getConfig('ebay_ckeditor_jira_plugin', 'Jira_API_URL');
        }
        return self::$serviceUrl;
    }

    private static function getDomainUrl() {
        $serviceAPI = libraries_get_path('raptorcms', FALSE) . '/core/Configuration.php';
        require_once ($serviceAPI);
        if (self::$domainUrl == NULL) {
            self::$domainUrl = RaptorCMSConfiguration::getConfig('ebay_ckeditor_jira_plugin', 'Jira_Domain_URL');
        }
        return self::$domainUrl;
    }

    private static function getSearchServiceUrl() {
        return self::getServiceUrl() . '/search';
    }

    private static function jiraRestApiCall($serviceUrl, $auth) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $serviceUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_TIMEOUT, 15);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization : Basic ' . $auth, 'Content-Type : application/json'));
        $response = curl_exec($ch);
        curl_close($ch);
        return drupal_json_decode($response);
    }

    public static function searchIssues($jql, $auth, $options = array()) {
        if ($jql == null || strlen($jql) <= 0) {
            return null;
        }
        $options['jql'] = $jql;
        $serviceUrl = self::getSearchServiceUrl();
        $serviceUrl .= '?' . http_build_query($options);
        return self::jiraRestApiCall($serviceUrl, $auth);
    }

    private static function getIssueDisplayInRow($issueData, $options = array()) {
        $fields = $issueData['fields'];
        $row = '';
        if (isset($options['T']) && $options['T'] == TRUE) {
            $iconUrl = $fields['issuetype']['iconUrl'];
            $typeName = $fields['issuetype']['name'];
            $row .= '<td><img src="' . $iconUrl . '" title="' . $typeName . '"></td>';
        }
        if (isset($options['Key']) && $options['Key'] == TRUE) {
            $status = $fields['status']['name'];
            $issueKey = $issueData['key'];
            $issueUrl = self::getDomainUrl() . '/browse/' . $issueKey;
            if ($status === 'Closed' || $status === 'Resolved') {
                $row .= '<td class="resolved">';
            }else {
                $row .= '<td>';
            }
            $row .= '<a href="' . $issueUrl . '">' . $issueKey . '</a></td>';
        }
        if (isset($options['P']) && $options['P'] == TRUE) {
            $prioIconUrl = $fields['priority']['iconUrl'];
            $row .= '<td><img src="' . $prioIconUrl . '"></td>';
        }
        if (isset($options['Summary']) && $options['Summary'] == TRUE) {
            $summary = $fields['summary'];
            $row .= '<td>' . $summary . '</td>';
        }
        if (isset($options['Assignee']) && $options['Assignee'] == TRUE) {
            $assigneeName = $fields['assignee']['displayName'];
            $row .= '<td>' . $assigneeName . '</td>';
        }
        if (isset($options['Reporter']) && $options['Reporter'] == TRUE) {
            $reporterName = $fields['reporter']['displayName'];
            $row .= '<td>' . $reporterName . '</td>';
        }
        if (isset($options['Status']) && $options['Status'] == TRUE) {
            $statusIconUrl = $fields['status']['iconUrl'];
            $row .= '<td><img src="' . $statusIconUrl . '">' . $status . '</td>';
        }
        if (isset($options['Created']) && $options['Created'] == TRUE) {
            $created = $fields['created'];
            $date = date_parse($created);
            $row .= '<td>' . $date['month'] . '/' . $date['day'] . '/' . $date['year'] . '</td>';
        }
        if (isset($options['Updated']) && $options['Updated'] == TRUE) {
            $updated = $fields['updated'];
            $date = date_parse($updated);
            $row .= '<td>' . $date['month'] . '/' . $date['day'] . '/' . $date['year'] . '</td>';
        }
        return '<tr>' . $row . '</tr>';
    }

    public static function getIssuesDisplayInTable($issues, $options = array()) {
        $display = '';
        if ($issues && isset($issues['errorMessages'])) {
            foreach ($issues['errorMessages'] as $error) {
                $display .= '<b>' . $error . '</b><br>';
            }
            return '<p>Error: ' . $display . '</p>';
        }
        $display .= '<table class="' . self::JIRA_TABLE_CLASS . '">';
        if (isset($options['showHeader']) && $options['showHeader'] == TRUE) {
            $th = '';
            foreach (self::$tableFields as $field) {
                if (isset($options[$field]) && $options[$field] == TRUE) {
                    $th .= '<th>' . $field . '</th>';
                }
            }
            
            $display .= '<tr>' . $th . '</tr>';
        }
        foreach ($issues['issues'] as $issue) {
            $display .= self::getIssueDisplayInRow($issue, $options);
        }
        $display .= '</table>';
        return $display;
    }

    /*public static function getIssueDisplay($data) {
        $display = '<p>';
        if ($data && isset($data['errorMessages'])) {
            foreach ($data['errorMessages'] as $error) {
                $display .= '<b>' . $error . '</b><br>';
            }
        } else {
            $issueUrl = self::getDomainUrl() . '/browse/' . $data['key'];
            $iconUrl = $data['fields']['issuetype']['iconUrl'];
            $summary = $data['fields']['summary'];
            $status = $data['fields']['status']['name'];
            if (strcasecmp($status, 'closed') == 0 || strcasecmp($status, 'resolved') == 0) {
                $display .= '<span class="jira-issue resolved">';
            } else {
                $display .= '<span class="jira-issue">';
            }
            $display .= '<a href="' . $issueUrl . '" style="background-image: url(\'' . $iconUrl . '\')">' . $data['key'] . '</a>';
            $display .= ' - ' . $summary . ' - ';
            $display .= '<span class="jira-status">' . $status . '</span>';
            $display .= '</span>';
        }
        $display .= '</p>';
        return $display;
    }*/

}
