# vim: sts=2 ts=2 sw=2 et ai
# 
{% set cron = salt['pillar.get']('cron') %}
{% for cmd,key in cron.iteritems() %}
{% set elem_dict = cmd.split(' ') %}
"{{ elem_dict[6:]|join(' ') }}":
  cron.present:
    - user: "{{ elem_dict[5] }}"
    - minute: "{{ elem_dict[0] }}" 
    - hour: "{{ elem_dict[1] }}"
    - daymonth: "{{ elem_dict[2] }}"
    - month: "{{ elem_dict[3] }}"
    - dayweek: "{{ elem_dict[4] }}"
    - comment: "{{ key }}"
    - identifier: "{{ cmd }}" 
{% endfor %}
