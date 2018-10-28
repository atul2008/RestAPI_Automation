#!/usr/bin/python
# -*- coding: utf-8 -*-
import features.steps.response_validator as _validate
from behave import *
import requests
import nose

use_step_matcher("parse")


@given(u'a request url {base_url}')
def set_base_url(context, base_url):
    if base_url.startswith("context"):
        context.base_url = getattr(context, base_url[8:])
    else:
        context.base_url = base_url.encode('ascii')


@given(u'API header Content-Type set {header_name} to {header_value}')
def set_header(context, header_name, header_value):
    if header_value.startswith("context"):
        context.headers[header_name.encode('ascii')] = getattr(context, header_value[8:]).encode('ascii')
    else:
        context.headers[header_name.encode('ascii')] = header_value.encode('ascii')


@given(u'Send untrusted {request_verb} request to base url')
def untrusted_request(context, request_verb):
    url = context.base_url
    context.r = getattr(requests, request_verb.lower())(url, headers=context.headers, verify=False)
    log_full(context.r)
    return context.r


@then(u'the response status code should equal {expected_http_status_code}')
def status_code_validation(context, expected_http_status_code):
    nose.tools.assert_equal(context.r.status_code, int(expected_http_status_code))


@then("the response status message should equal {expected_http_status_message}")
def status_message_validation(context, expected_http_status_message):
    nose.tools.assert_equal(context.r.reason, str(expected_http_status_message))


@then(u'the response header {header_name} should equal {expected_header_value}')
def parameter_validation(context, header_name, expected_header_value):
    nose.tools.assert_equal(context.r.headers[header_name], str(expected_header_value))


@step(u'a request sends {request_verb}')
def get_request(context, request_verb):
    if not hasattr(context, 'verify_ssl'):
        context.verify_ssl = True
    url = context.base_url
    context.r = getattr(requests, request_verb.lower())(url, headers=context.headers, verify=context.verify_ssl)
    log_full(context.r)
    return context.r


@step(u'the response json at {json_path} is equal to {expected_json_value}')
def step_impl(context, json_path, expected_json_value):
    json_body = context.r.json()
    _validate.response_json_matches_at(json_body, json_path, expected_json_value)


@step(u'the response json with promotional elements at {json_path} is equal to {expected_json_value}')
def step_impl(context, json_path, expected_json_value):
    json_body = context.r.json()
    _validate.response_json_with_promotions_elements_at(json_body, json_path, expected_json_value)


@step(u'Get all Promotion element with {get_name} is {expected_name} has a {get_desc} contains {expected_description}')
def step_impl(context, get_name, get_desc, expected_name, expected_description):
    json_body = context.r.json()
    _validate.response_json_element_description_at(json_body, get_name, get_desc, expected_name, expected_description)


@step(u'the response json matches with the business farming industry name carbon credits schema')
def step_impl(context):
    schema = context.text
    json_body = context.r.json()
    _validate.response_json_matches(json_body, schema)


@step(u'{text} SSL certificate')
def step_impl(context, text):
    if text == "Enable":
        context.verify_ssl = True
    else:
        context.verify_ssl = False


def log_full(r):
    req = r.request
    """
    At this point it is completely built and ready
    to be fired; it is "prepared".

    However pay attention at the formatting used in
    this function because it is programmed to be pretty
    printed and may differ from the actual request.
    """

    print("")
    print("")

    print('{}\n{}\n{}\n\n{}'.format(
        '-----------REQUEST-----------',
        req.method + ' ' + req.url,
        '\n'.join('{}: {}'.format(k, v) for k, v in req.headers.items()),
        req.body,
    ))

    print("")

    print('{}\n{}\n{}\n\n{}'.format(
        '-----------RESPONSE-----------',
        str(r.status_code) + ' ' + r.reason,
        '\n'.join('{}: {}'.format(k, v) for k, v in r.headers.items()),
        r.text,
    ))
    print("")

    print('Operation took ' + str(round(r.elapsed.total_seconds(), 3)) + 's')

    print("")
    print("")
    print("")
    print("")
