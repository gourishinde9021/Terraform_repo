TF_LOG Options:

1. TRACE - Provides most detailed logs which can be useful for deep debugging
2. WARN - Logs only warning, indicating potential issues but no failures
3. DEBUG - Detailed logging of provider calls, variable executions and resource planning
4. INFO - Normal operations when you are interested in high level understanding of terraform steps
5. ERROR - Logs only fatal error that prevent terraform from continuing


To Set debug logs
    export TF_LOG=DEBUG

To unset TF_LOG
 
     unset TF_LOG
