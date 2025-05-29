FROM odoo:18.0

USER root

COPY ./addons /mnt/extra-addons

WORKDIR /opp/odoo

RUN apt-get update && apt-get install -y libreoffice && apt-get clean

COPY ./requirements.txt /opt/odoo/requirements.txt --break-system-packages

RUN pip3 install -r /opt/odoo/requirements.txt
USER odoo

CMD ["odoo"]
