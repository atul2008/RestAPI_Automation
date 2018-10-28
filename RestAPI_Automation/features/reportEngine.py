#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
from shutil import rmtree
from behave import __main__ as runner_with_options


def clean_existing_report(report_param):
    """
    Delete existing tree structure and create a new one
    """
    if os.path.exists(report_param):
        rmtree(report_param)


if __name__ == '__main__':
    sys.stdout.flush()
    define_reports = ['report-source-data', 'junit-compatible-report', 'allure-reports']
    for elem in define_reports:
        clean_existing_report(elem)
        os.makedirs(elem)

    tagOptions = ''
    featurePath = ''
    reportingRelated = ' -f allure_behave.formatter:AllureFormatter -o ' + define_reports[0] + '  '
    commonRunnerOptions = ' --no-summary --no-capture --no-capture-stderr --format pretty '
    fullRunnerOptions = tagOptions + reportingRelated + commonRunnerOptions + featurePath
    runner_with_options.main(fullRunnerOptions)
    relative_path = os.getcwd() + "/" + define_reports[0]
    get_allure_report = 'allure generate ' + relative_path + ' -o ' + define_reports[2]
    openReport = 'allure open ' + define_reports[2]
    os.system(get_allure_report)
    os.system(openReport)
