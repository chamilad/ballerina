#!/usr/bin/env bash

if [ "$debug" == "true" ]; then
    echo "Ballerina version: ${project_version}"
    echo "Ballerina files location: ${bal_files_home}"
    echo "Load samples: ${load_samples}"
fi

# Gather argument string from test Ballerina services
test_services=$(find $bal_files_home -type f -name "*.bal" | tr '\n' ' ')
arg_str="${test_services}"

# Gather sample string from shipped Ballerina samples. Only picks up files with "Service" in the name
samples_str=$(find "/maven/ballerina-${project_version}/samples" -type f -name "*.bsz" | tr '\n' ' ')

if [ "$load_samples" == "true" ]; then
    arg_str="${test_services} ${samples_str}"
fi

# Run ballerinaServer with the argument string
if [ "$debug" == "true" ]; then
    echo "Arg string: ${arg_str}"
fi

bash /maven/ballerina-$project_version/bin/ballerina run service $arg_str