from flask import Flask
from flask import render_template
from flask import request
import interface


app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def hello_world():
    if request.method == 'GET':
        if request.args.get('report') is not None and \
                request.args.get('date_begin') is not None and \
                request.args.get('date_end'):
            date_begin = request.args.get('date_begin')
            date_end = request.args.get('date_begin')
            report = request.args.get('report')
        else:
            report = None
        if report is not None:

            res = interface.main(report)
            return render_template('view.html',
                                   rows=res,
                                   date_begin=date_begin,
                                   date_end=date_end,
                                   report=report)

    return render_template('index.html')


@app.route('/approve', methods=['POST', 'GET'])
def approve():
    if request.method == 'GET':
        if request.args.get('report') is not None:
            report = request.args.get('report')
            date_begin = request.args.get('date_begin')
            date_end = request.args.get('date_begin')
            interface.add_to_res1()
    return render_template('index.html')


@app.route('/change', methods=['POST', 'GET'])
def change():
    if request.method == 'GET':
        if request.args.get('sql') is not None:
            return render_template('index.html')
    return render_template('change.html')


if __name__ == '__main__':
    app.run()
