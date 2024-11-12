#!/usr/bin/env python

import json
import os
import sys
import time
import urllib.parse
from pprint import pprint

from grafana_api.grafana_face import GrafanaFace


grafana_api: GrafanaFace = None


# core_db = {'uid': 'has_warehouse_hive_raw',
#            'job': 'has_warehouse_hive_raw',
#            'group': 'has_data_warehouse_flink'
#            }


# target_db = [
#     {'group': 'has_realtime_flink',
#      'jobs': [
#          "has_report_analysis",
#          "has_report_basic_bid",
#          "has_report_basic_imp",
#      ]},
#     {'group': 'has_crowd_flink',
#      'jobs': ["has_crowd_redirection"]},
#     {'group': 'has_data_warehouse_flink',
#      'jobs': [
#          "has_warehouse_etl_bid",
#          "has_warehouse_etl_imp",
#          "has_warehouse_hive_clean_bid",
#          "has_warehouse_hive_clean_imp"
#      ]}
# ]


def get_folder_id(need_dir):
    all_folder = grafana_api.folder.get_all_folders()
    # print(type(response))
    # good_resp = str(response).replace("'", "\"")
    # all_dirs = json.loads(good_resp)
    return [s['id'] for s in all_folder if s["title"] == need_dir][0]


# def get_dashboard_uid(dashboard, folder_id=None):
#     dashboards = grafana_api.search.search_dashboards(query=dashboard, folder_ids=folder_id)
#     # print(dashboards)
#     return [s['uid'] for s in dashboards if s["title"] == dashboard][0]


def get_dashboard_json_list(folder_id=None):
    return grafana_api.search.search_dashboards(folder_ids=folder_id)

def get_dashboard_uid(dashboard, folder_id=None):
    dashboards = grafana_api.search.search_dashboards(query=dashboard, folder_ids=folder_id)
    # print(dashboards)
    return [s['uid'] for s in dashboards if s["title"] == dashboard][0]


# def get_dashboard_json(folder_id=None):
#     dashboard_uid = core_db['uid']
#     uid = get_dashboard_uid(dashboard_uid, folder_id)
#     return grafana_api.dashboard.get_dashboard(uid)['dashboard']


# def update_dashboard(dashboard_json):
#     # grafana_api.dashboard.update_dashboard(dashboard_json)
#     return requests.post(url=protocol + '://' + host + '/api/dashboards/db'
#                          , headers={"Content-Type": "application/json",
#                                     "Authorization": "Bearer " + auth}
#                          , json=dashboard_json).json()
# json_str = json.dumps(dashboard_json)
# return os.popen('''
#     curl -H "Content-Type: application/json"
#         -H "Authorization: Bearer %s"
#         %s://%s/api/dashboards/db  -d '%s'
#     ''' % (auth, host, protocol, json_str)).readlines()


# def convert_dashboard(core_json: str, group: str, job: str, folder_id):
#     json_str = json.dumps(core_json)
#     new_json_str = json_str \
#         .replace(core_db['group'], group) \
#         .replace(core_db['job'], job)
#     new_json = json.loads(new_json_str)
#     new_json['id'] = None
#     res_json = {
#         "dashboard": new_json,
#         "folderId": folder_id,
#         "overwrite": True
#     }
#     return res_json


def clear_dashboard_id(core_json: str):
    json_obj = json.loads(core_json)
    json_obj.pop('id')
    json_obj.pop('uid')


def backup_json_list(json_list, backup_dir):
    backup_dir = os.path.realpath(backup_dir)
    if os.path.isdir(backup_dir):
        old_backup_dir = os.path.join("/tmp/grafana-backup-" + str(time.time()).split(".")[0])
        os.rename(backup_dir, old_backup_dir)
        print("old backup dir move to:", old_backup_dir)

    os.makedirs(backup_dir)
    # file_list = list(filter(lambda f: f.endswith('.json'), os.listdir(backup_dir)))
    # if len(file_list) > 0:
    #     os.makedirs(old_backup_dir)
    #     for file in file_list:
    #         os.rename(os.path.join(backup_dir, file),
    #                   os.path.join(old_backup_dir, file))

    for core_json in json_list:
        jons_str = json.dumps(core_json)
        path = os.path.join(backup_dir, core_json['title'] + ".json")
        open(path, 'w').write(jons_str)
        print("backup -> " + path)


def main():
    print(sys.argv)
    _, url, auth, folder, backup_dir = sys.argv
    parsed_url = urllib.parse.urlparse(url)
    host = parsed_url.netloc
    protocol = parsed_url.scheme
    global grafana_api
    grafana_api = GrafanaFace(auth=auth, host=host, protocol=protocol)

    folder_id = get_folder_id(folder)
    json_list = get_dashboard_json_list(folder_id)
    pprint(json_list)
    res = grafana_api.dashboard.get_dashboard("vlvPlrgnk")
    pprint(res)
    # backup_json_list(json_list, backup_dir)
    # for group_dict in target_db:
    #     group = group_dict['group']
    #     for job in group_dict['jobs']:
    #         new_json = convert_dashboard(core_json, group, job, folder_id)
    #         res = update_dashboard(new_json)
    #         print("job: %s, group: %s : %s" % (job, group, res))


if __name__ == '__main__':
    sys.argv = ["","http://xxxxxx","xxxxx",
        "good","backup_all"]
    main()
