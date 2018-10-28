from assertpy import fail
from typing import List, Any, Tuple
import json
import objectpath
import jsonschema
import nose


def response_json_matches(response, schema_str):
    schema = json.loads(schema_str)
    _validate_with_schema(response, schema)


def response_json_matches_at(json_body, json_path, expected_str):
    actual_value = _get_value(json_body, json_path)
    nose.tools.assert_equal(actual_value, eval(expected_str))


def _get_value(json_body, json_path):
    tree = objectpath.Tree(json_body)
    result = tree.execute(json_path)
    if not result:
        fail('Match not found at <{path}> for <{body}>'.format(path=json_path, body=json_body))

    return result


def response_json_with_promotions_elements_at(json_body, json_path, expected_str):
    values = _get_values(json_body, json_path)
    [nose.tools.assert_equal(retrieve_values, eval(expected_str)) for retrieve_values in values]


def _get_values(json_body, json_path):
    nested_tree = objectpath.Tree(json_body)
    results = nested_tree.execute(json_path)
    if not results:
        fail('Match not found at <{path}> for <{body}>'.format(path=json_path, body=json_body))
    values = [result for result in results]

    return values


def response_json_element_description_at(json_body, promo_name, promo_desc, expected_name, expected_description):
    nested_tree = objectpath.Tree(json_body)
    values = list(nested_tree.execute(promo_desc))
    keys = list(nested_tree.execute(promo_name))
    key_value_list = list(zip(keys, values))
    if not key_value_list:
        fail('Match not found at <{path}> for <{body}>'.format(path=keys, body=values))
    output_result: List[Tuple[Any, Any]] = []
    for index, match in enumerate(key_value_list):
        if match[0] == expected_name and match[1].count(expected_description) > 0:
            output_result.append(match)
    if not output_result:
        fail('Match not found at <{path}>,<{_path}>for <{body}>'.format(path=expected_name, _path=expected_description, body=json_body))
    [nose.tools.assert_equal(get_val[0], expected_name) for get_val in output_result]
    [nose.tools.assert_true((get_val[1].count(expected_description) > 0)) for get_val in output_result]


def _validate_with_schema(json_body, schema):
    jsonschema.validate(json_body, schema)
