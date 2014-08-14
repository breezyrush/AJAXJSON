from dosql import *
import cgi
import json

def index(req, course, section, semid):
    course = cgi.escape(course)
    section = cgi.escape(section)
    semid = cgi.escape(semid)
    x = doSql()
    rets = x.execqry("select * from get_listing('" + course + "', '" + section + "', '" + semid + "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
