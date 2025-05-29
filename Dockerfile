FROM odoo:18.0

USER root

COPY ./addons /mnt/extra-addons

WORKDIR /opp/odoo

RUN apt-get update && apt-get install -y libreoffice && apt-get clean

COPY ./requirement.txt /opt/odoo/requirement.txt

RUN pip3 install -r /opt/odoo/requirement.txt
USER odoo

CMD ["odoo"]
