FROM odoo:18.0

USER root

COPY ./addons /mnt/extra-addons

WORKDIR /opp/odoo

# Install system dependencies, including Brlapi system package
RUN apt-get update && apt-get install -y \
    libreoffice \
    libbrlapi-dev \
 && apt-get clean

COPY ./requirements.txt /opt/odoo/requirements.txt

RUN pip3 install -r /opt/odoo/requirements.txt --break-system-packages
USER odoo

CMD ["odoo"]
