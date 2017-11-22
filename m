Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76AEBE00D00; Wed, 22 Nov 2017 08:10:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DB55E00D17
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMG9chD003543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:09:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:09:30 -0500
Message-ID: <1511366970-9229-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511366970-9229-1-git-send-email-mark.asselstine@windriver.com>
References: <1511366970-9229-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/2] python-horizon: fixups to get things working with stable/pike
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2017 16:10:07 -0000
Content-Type: text/plain

A number of changes to get the openstack-dashboard up and running. We
replace the old copy of local_setttings.py with a new version from
source. Along with this we avoid touches to settings.py (it 'sources'
local_settings.py so we should consolidate our changes there). We run
django's 'collectstatic' as a postinst, this matches other distros and
the openstack documentation, as well as easing the procedure to move
from debug to production.

For some operations horizon is attempting to use keystone v2.0 instead
of v3 so there remain some issues. Overall, horizon is functional so
we will call this 'working' and complete any additional fixups
individually which will allow for better tracking of the changes.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-horizon/local_settings.py        | 690 +++++++++++++++++----
 .../python/python-horizon/wsgi-horizon.conf        |  14 +
 .../recipes-devtools/python/python-horizon_git.bb  |  93 +--
 3 files changed, 638 insertions(+), 159 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-horizon/wsgi-horizon.conf

diff --git a/meta-openstack/recipes-devtools/python/python-horizon/local_settings.py b/meta-openstack/recipes-devtools/python/python-horizon/local_settings.py
index 3ba4ab0..777d1d3 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon/local_settings.py
+++ b/meta-openstack/recipes-devtools/python/python-horizon/local_settings.py
@@ -1,13 +1,39 @@
+# -*- coding: utf-8 -*-
+
 import os
 
 from django.utils.translation import ugettext_lazy as _
 
-from openstack_dashboard import exceptions
+from horizon.utils import secret_key
+
+from openstack_dashboard.settings import HORIZON_CONFIG
 
 DEBUG = True
-TEMPLATE_DEBUG = DEBUG
 
-# Required for Django 1.5.
+STATIC_ROOT = '%LOCAL_PATH%'
+
+# This setting controls whether or not compression is enabled. Disabling
+# compression makes Horizon considerably slower, but makes it much easier
+# to debug JS and CSS changes
+#COMPRESS_ENABLED = not DEBUG
+
+# This setting controls whether compression happens on the fly, or offline
+# with `python manage.py compress`
+# See https://django-compressor.readthedocs.io/en/latest/usage/#offline-compression
+# for more information
+#COMPRESS_OFFLINE = not DEBUG
+
+# WEBROOT is the location relative to Webserver root
+# should end with a slash.
+WEBROOT = '/horizon/'
+#LOGIN_URL = WEBROOT + 'auth/login/'
+#LOGOUT_URL = WEBROOT + 'auth/logout/'
+#
+# LOGIN_REDIRECT_URL can be used as an alternative for
+# HORIZON_CONFIG.user_home, if user_home is not set.
+# Do not set it to '/home/', as this will cause circular redirect loop
+#LOGIN_REDIRECT_URL = WEBROOT
+
 # If horizon is running in production (DEBUG is False), set this
 # with the list of host/domain names that the application can serve.
 # For more information see:
@@ -15,96 +41,130 @@ TEMPLATE_DEBUG = DEBUG
 #ALLOWED_HOSTS = ['horizon.example.com', ]
 
 # Set SSL proxy settings:
-# For Django 1.4+ pass this header from the proxy after terminating the SSL,
+# Pass this header from the proxy after terminating the SSL,
 # and don't forget to strip it from the client's request.
 # For more information see:
-# https://docs.djangoproject.com/en/1.4/ref/settings/#secure-proxy-ssl-header
-# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTOCOL', 'https')
+# https://docs.djangoproject.com/en/dev/ref/settings/#secure-proxy-ssl-header
+#SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
 
 # If Horizon is being served through SSL, then uncomment the following two
 # settings to better secure the cookies from security exploits
 #CSRF_COOKIE_SECURE = True
 #SESSION_COOKIE_SECURE = True
 
+# The absolute path to the directory where message files are collected.
+# The message file must have a .json file extension. When the user logins to
+# horizon, the message files collected are processed and displayed to the user.
+#MESSAGES_PATH=None
+
 # Overrides for OpenStack API versions. Use this setting to force the
-# OpenStack dashboard to use a specfic API version for a given service API.
+# OpenStack dashboard to use a specific API version for a given service API.
+# Versions specified here should be integers or floats, not strings.
 # NOTE: The version should be formatted as it appears in the URL for the
 # service API. For example, The identity service APIs have inconsistent
-# use of the decimal point, so valid options would be "2.0" or "3".
-# OPENSTACK_API_VERSIONS = {
-#     "identity": 3
-# }
+# use of the decimal point, so valid options would be 2.0 or 3.
+# Minimum compute version to get the instance locked status is 2.9.
+#OPENSTACK_API_VERSIONS = {
+#    "data-processing": 1.1,
+#    "identity": 3,
+#    "image": 2,
+#    "volume": 2,
+#    "compute": 2,
+#}
 
-# Set this to True if running on multi-domain model. When this is enabled, it
-# will require user to enter the Domain name in addition to username for login.
-# OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = False
+# Set this to True if running on a multi-domain model. When this is enabled, it
+# will require the user to enter the Domain name in addition to the username
+# for login.
+#OPENSTACK_KEYSTONE_MULTIDOMAIN_SUPPORT = False
+
+# Set this to True if you want available domains displayed as a dropdown menu
+# on the login screen. It is strongly advised NOT to enable this for public
+# clouds, as advertising enabled domains to unauthenticated customers
+# irresponsibly exposes private information. This should only be used for
+# private clouds where the dashboard sits behind a corporate firewall.
+#OPENSTACK_KEYSTONE_DOMAIN_DROPDOWN = False
+
+# If OPENSTACK_KEYSTONE_DOMAIN_DROPDOWN is enabled, this option can be used to
+# set the available domains to choose from. This is a list of pairs whose first
+# value is the domain name and the second is the display name.
+#OPENSTACK_KEYSTONE_DOMAIN_CHOICES = (
+#  ('Default', 'Default'),
+#)
 
 # Overrides the default domain used when running on single-domain model
 # with Keystone V3. All entities will be created in the default domain.
-# OPENSTACK_KEYSTONE_DEFAULT_DOMAIN = 'Default'
+# NOTE: This value must be the name of the default domain, NOT the ID.
+# Also, you will most likely have a value in the keystone policy file like this
+#    "cloud_admin": "rule:admin_required and domain_id:<your domain id>"
+# This value must be the name of the domain whose ID is specified there.
+#OPENSTACK_KEYSTONE_DEFAULT_DOMAIN = 'Default'
+
+# Set this to True to enable panels that provide the ability for users to
+# manage Identity Providers (IdPs) and establish a set of rules to map
+# federation protocol attributes to Identity API attributes.
+# This extension requires v3.0+ of the Identity API.
+#OPENSTACK_KEYSTONE_FEDERATION_MANAGEMENT = False
 
 # Set Console type:
-# valid options would be "AUTO", "VNC" or "SPICE"
-# CONSOLE_TYPE = "AUTO"
-
-# Default OpenStack Dashboard configuration.
-HORIZON_CONFIG = {
-    'dashboards': ('project', 'admin', 'settings',),
-    'default_dashboard': 'project',
-    'user_home': 'openstack_dashboard.views.get_user_home',
-    'ajax_queue_limit': 10,
-    'auto_fade_alerts': {
-        'delay': 3000,
-        'fade_duration': 1500,
-        'types': ['alert-success', 'alert-info']
-    },
-    'help_url': "http://docs.openstack.org",
-    'exceptions': {'recoverable': exceptions.RECOVERABLE,
-                   'not_found': exceptions.NOT_FOUND,
-                   'unauthorized': exceptions.UNAUTHORIZED},
-}
+# valid options are "AUTO"(default), "VNC", "SPICE", "RDP", "SERIAL" or None
+# Set to None explicitly if you want to deactivate the console.
+#CONSOLE_TYPE = "AUTO"
+
+# If provided, a "Report Bug" link will be displayed in the site header
+# which links to the value of this setting (ideally a URL containing
+# information on how to report issues).
+#HORIZON_CONFIG["bug_url"] = "http://bug-report.example.com"
+
+# Show backdrop element outside the modal, do not close the modal
+# after clicking on backdrop.
+#HORIZON_CONFIG["modal_backdrop"] = "static"
 
 # Specify a regular expression to validate user passwords.
-# HORIZON_CONFIG["password_validator"] = {
-#     "regex": '.*',
-#     "help_text": _("Your password does not meet the requirements.")
-# }
+#HORIZON_CONFIG["password_validator"] = {
+#    "regex": '.*',
+#    "help_text": _("Your password does not meet the requirements."),
+#}
 
 # Disable simplified floating IP address management for deployments with
 # multiple floating IP pools or complex network requirements.
-# HORIZON_CONFIG["simple_ip_management"] = False
+#HORIZON_CONFIG["simple_ip_management"] = False
 
-# Turn off browser autocompletion for the login form if so desired.
-# HORIZON_CONFIG["password_autocomplete"] = "off"
+# Turn off browser autocompletion for forms including the login form and
+# the database creation workflow if so desired.
+#HORIZON_CONFIG["password_autocomplete"] = "off"
 
-LOCAL_PATH = "/usr/share/openstack-dashboard/openstack_dashboard/static"
+# Setting this to True will disable the reveal button for password fields,
+# including on the login form.
+#HORIZON_CONFIG["disable_password_reveal"] = False
+
+LOCAL_PATH = '%LOCAL_PATH%'
 
 # Set custom secret key:
-# You can either set it to a specific value or you can let horizion generate a
+# You can either set it to a specific value or you can let horizon generate a
 # default secret key that is unique on this machine, e.i. regardless of the
-# amount of Python WSGI workers (if used behind Apache+mod_wsgi): However, there
-# may be situations where you would want to set this explicitly, e.g. when
-# multiple dashboard instances are distributed on different machines (usually
-# behind a load-balancer). Either you have to make sure that a session gets all
-# requests routed to the same dashboard instance or you set the same SECRET_KEY
-# for all of them.
-from horizon.utils import secret_key
-SECRET_KEY = secret_key.generate_or_read_from_file(os.path.join(LOCAL_PATH, '.secret_key_store'))
+# amount of Python WSGI workers (if used behind Apache+mod_wsgi): However,
+# there may be situations where you would want to set this explicitly, e.g.
+# when multiple dashboard instances are distributed on different machines
+# (usually behind a load-balancer). Either you have to make sure that a session
+# gets all requests routed to the same dashboard instance or you set the same
+# SECRET_KEY for all of them.
+SECRET_KEY = secret_key.generate_or_read_from_file(
+    os.path.join(LOCAL_PATH, '.secret_key_store'))
 
 # We recommend you use memcached for development; otherwise after every reload
 # of the django development server, you will have to login again. To use
 # memcached set CACHES to something like
 CACHES = {
     'default': {
-        'BACKEND' : 'django.core.cache.backends.memcached.MemcachedCache',
-        'LOCATION' : '127.0.0.1:11211',
-    }
+        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
+        'LOCATION': '127.0.0.1:11211',
+    },
 }
 
 #CACHES = {
 #    'default': {
-#        'BACKEND' : 'django.core.cache.backends.locmem.LocMemCache'
-#    }
+#        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
+#    },
 #}
 
 # Send email to the console by default
@@ -113,26 +173,75 @@ EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
 #EMAIL_BACKEND = 'django.core.mail.backends.dummy.EmailBackend'
 
 # Configure these for your outgoing email host
-# EMAIL_HOST = 'smtp.my-company.com'
-# EMAIL_PORT = 25
-# EMAIL_HOST_USER = 'djangomail'
-# EMAIL_HOST_PASSWORD = 'top-secret!'
+#EMAIL_HOST = 'smtp.my-company.com'
+#EMAIL_PORT = 25
+#EMAIL_HOST_USER = 'djangomail'
+#EMAIL_HOST_PASSWORD = 'top-secret!'
 
 # For multiple regions uncomment this configuration, and add (endpoint, title).
-# AVAILABLE_REGIONS = [
-#     ('http://cluster1.example.com:5000/v2.0', 'cluster1'),
-#     ('http://cluster2.example.com:5000/v2.0', 'cluster2'),
-# ]
+#AVAILABLE_REGIONS = [
+#    ('http://cluster1.example.com:5000/v2.0', 'cluster1'),
+#    ('http://cluster2.example.com:5000/v2.0', 'cluster2'),
+#]
 
 OPENSTACK_HOST = "127.0.0.1"
-OPENSTACK_KEYSTONE_URL = "http://%s:8081/keystone/main/v2.0" % OPENSTACK_HOST
-OPENSTACK_KEYSTONE_DEFAULT_ROLE = "Member"
+OPENSTACK_KEYSTONE_URL = "http://%s:5000/v2.0" % OPENSTACK_HOST
+OPENSTACK_KEYSTONE_DEFAULT_ROLE = "_member_"
+
+# For setting the default service region on a per-endpoint basis. Note that the
+# default value for this setting is {}, and below is just an example of how it
+# should be specified.
+DEFAULT_SERVICE_REGIONS = {
+    OPENSTACK_KEYSTONE_URL: 'RegionOne'
+}
+
+# Enables keystone web single-sign-on if set to True.
+#WEBSSO_ENABLED = False
+
+# Determines which authentication choice to show as default.
+#WEBSSO_INITIAL_CHOICE = "credentials"
+
+# The list of authentication mechanisms which include keystone
+# federation protocols and identity provider/federation protocol
+# mapping keys (WEBSSO_IDP_MAPPING). Current supported protocol
+# IDs are 'saml2' and 'oidc'  which represent SAML 2.0, OpenID
+# Connect respectively.
+# Do not remove the mandatory credentials mechanism.
+# Note: The last two tuples are sample mapping keys to a identity provider
+# and federation protocol combination (WEBSSO_IDP_MAPPING).
+#WEBSSO_CHOICES = (
+#    ("credentials", _("Keystone Credentials")),
+#    ("oidc", _("OpenID Connect")),
+#    ("saml2", _("Security Assertion Markup Language")),
+#    ("acme_oidc", "ACME - OpenID Connect"),
+#    ("acme_saml2", "ACME - SAML2"),
+#)
+
+# A dictionary of specific identity provider and federation protocol
+# combinations. From the selected authentication mechanism, the value
+# will be looked up as keys in the dictionary. If a match is found,
+# it will redirect the user to a identity provider and federation protocol
+# specific WebSSO endpoint in keystone, otherwise it will use the value
+# as the protocol_id when redirecting to the WebSSO by protocol endpoint.
+# NOTE: The value is expected to be a tuple formatted as: (<idp_id>, <protocol_id>).
+#WEBSSO_IDP_MAPPING = {
+#    "acme_oidc": ("acme", "oidc"),
+#    "acme_saml2": ("acme", "saml2"),
+#}
+
+# The Keystone Provider drop down uses Keystone to Keystone federation
+# to switch between Keystone service providers.
+# Set display name for Identity Provider (dropdown display name)
+#KEYSTONE_PROVIDER_IDP_NAME = "Local Keystone"
+# This id is used for only for comparison with the service provider IDs. This ID
+# should not match any service provider IDs.
+#KEYSTONE_PROVIDER_IDP_ID = "localkeystone"
 
 # Disable SSL certificate checks (useful for self-signed certificates):
-# OPENSTACK_SSL_NO_VERIFY = True
+#OPENSTACK_SSL_NO_VERIFY = True
 
 # The CA certificate to use to verify SSL connections
-# OPENSTACK_SSL_CACERT = '/path/to/cacert.pem'
+#OPENSTACK_SSL_CACERT = '/path/to/cacert.pem'
 
 # The OPENSTACK_KEYSTONE_BACKEND settings can be used to identify the
 # capabilities of the auth backend for Keystone.
@@ -146,45 +255,174 @@ OPENSTACK_KEYSTONE_BACKEND = {
     'can_edit_group': True,
     'can_edit_project': True,
     'can_edit_domain': True,
-    'can_edit_role': True
+    'can_edit_role': True,
 }
 
+# Setting this to True, will add a new "Retrieve Password" action on instance,
+# allowing Admin session password retrieval/decryption.
+#OPENSTACK_ENABLE_PASSWORD_RETRIEVE = False
+
+# This setting allows deployers to control whether a token is deleted on log
+# out. This can be helpful when there are often long running processes being
+# run in the Horizon environment.
+#TOKEN_DELETION_DISABLED = False
+
+# The Launch Instance user experience has been significantly enhanced.
+# You can choose whether to enable the new launch instance experience,
+# the legacy experience, or both. The legacy experience will be removed
+# in a future release, but is available as a temporary backup setting to ensure
+# compatibility with existing deployments. Further development will not be
+# done on the legacy experience. Please report any problems with the new
+# experience via the Launchpad tracking system.
+#
+# Toggle LAUNCH_INSTANCE_LEGACY_ENABLED and LAUNCH_INSTANCE_NG_ENABLED to
+# determine the experience to enable.  Set them both to true to enable
+# both.
+#LAUNCH_INSTANCE_LEGACY_ENABLED = True
+#LAUNCH_INSTANCE_NG_ENABLED = False
+
+# A dictionary of settings which can be used to provide the default values for
+# properties found in the Launch Instance modal.
+#LAUNCH_INSTANCE_DEFAULTS = {
+#    'config_drive': False,
+#    'enable_scheduler_hints': True,
+#    'disable_image': False,
+#    'disable_instance_snapshot': False,
+#    'disable_volume': False,
+#    'disable_volume_snapshot': False,
+#    'create_volume': True,
+#}
+
+# The Xen Hypervisor has the ability to set the mount point for volumes
+# attached to instances (other Hypervisors currently do not). Setting
+# can_set_mount_point to True will add the option to set the mount point
+# from the UI.
 OPENSTACK_HYPERVISOR_FEATURES = {
-    'can_set_mount_point': True,
+    'can_set_mount_point': False,
+    'can_set_password': False,
+    'requires_keypair': False,
+    'enable_quotas': True
+}
+
+# The OPENSTACK_CINDER_FEATURES settings can be used to enable optional
+# services provided by cinder that is not exposed by its extension API.
+OPENSTACK_CINDER_FEATURES = {
+    'enable_backup': False,
 }
 
 # The OPENSTACK_NEUTRON_NETWORK settings can be used to enable optional
-# services provided by neutron. Options currenly available are load
+# services provided by neutron. Options currently available are load
 # balancer service, security groups, quotas, VPN service.
 OPENSTACK_NEUTRON_NETWORK = {
-    'enable_lb': False,
-    'enable_firewall': False,
+    'enable_router': True,
     'enable_quotas': True,
-    'enable_vpn': False,
-    # The profile_support option is used to detect if an external router can be
-    # configured via the dashboard. When using specific plugins the
-    # profile_support can be turned on if needed.
-    'profile_support': None,
-    #'profile_support': 'cisco',
+    'enable_ipv6': True,
+    'enable_distributed_router': False,
+    'enable_ha_router': False,
+    'enable_fip_topology_check': True,
+
+    # Default dns servers you would like to use when a subnet is
+    # created.  This is only a default, users can still choose a different
+    # list of dns servers when creating a new subnet.
+    # The entries below are examples only, and are not appropriate for
+    # real deployments
+    # 'default_dns_nameservers': ["8.8.8.8", "8.8.4.4", "208.67.222.222"],
+
+    # Set which provider network types are supported. Only the network types
+    # in this list will be available to choose from when creating a network.
+    # Network types include local, flat, vlan, gre, vxlan and geneve.
+    # 'supported_provider_types': ['*'],
+
+    # You can configure available segmentation ID range per network type
+    # in your deployment.
+    # 'segmentation_id_range': {
+    #     'vlan': [1024, 2048],
+    #     'vxlan': [4094, 65536],
+    # },
+
+    # You can define additional provider network types here.
+    # 'extra_provider_types': {
+    #     'awesome_type': {
+    #         'display_name': 'Awesome New Type',
+    #         'require_physical_network': False,
+    #         'require_segmentation_id': True,
+    #     }
+    # },
+
+    # Set which VNIC types are supported for port binding. Only the VNIC
+    # types in this list will be available to choose from when creating a
+    # port.
+    # VNIC types include 'normal', 'direct', 'direct-physical', 'macvtap',
+    # 'baremetal' and 'virtio-forwarder'
+    # Set to empty list or None to disable VNIC type selection.
+    'supported_vnic_types': ['*'],
+
+    # Set list of available physical networks to be selected in the physical
+    # network field on the admin create network modal. If it's set to an empty
+    # list, the field will be a regular input field.
+    # e.g. ['default', 'test']
+    'physical_networks': [],
+
+}
+
+# The OPENSTACK_HEAT_STACK settings can be used to disable password
+# field required while launching the stack.
+OPENSTACK_HEAT_STACK = {
+    'enable_user_pass': True,
 }
 
 # The OPENSTACK_IMAGE_BACKEND settings can be used to customize features
 # in the OpenStack Dashboard related to the Image service, such as the list
 # of supported image formats.
-# OPENSTACK_IMAGE_BACKEND = {
-#     'image_formats': [
-#         ('', ''),
-#         ('aki', _('AKI - Amazon Kernel Image')),
-#         ('ami', _('AMI - Amazon Machine Image')),
-#         ('ari', _('ARI - Amazon Ramdisk Image')),
-#         ('iso', _('ISO - Optical Disk Image')),
-#         ('qcow2', _('QCOW2 - QEMU Emulator')),
-#         ('raw', _('Raw')),
-#         ('vdi', _('VDI')),
-#         ('vhd', _('VHD')),
-#         ('vmdk', _('VMDK'))
-#     ]
-# }
+#OPENSTACK_IMAGE_BACKEND = {
+#    'image_formats': [
+#        ('', _('Select format')),
+#        ('aki', _('AKI - Amazon Kernel Image')),
+#        ('ami', _('AMI - Amazon Machine Image')),
+#        ('ari', _('ARI - Amazon Ramdisk Image')),
+#        ('docker', _('Docker')),
+#        ('iso', _('ISO - Optical Disk Image')),
+#        ('ova', _('OVA - Open Virtual Appliance')),
+#        ('qcow2', _('QCOW2 - QEMU Emulator')),
+#        ('raw', _('Raw')),
+#        ('vdi', _('VDI - Virtual Disk Image')),
+#        ('vhd', _('VHD - Virtual Hard Disk')),
+#        ('vhdx', _('VHDX - Large Virtual Hard Disk')),
+#        ('vmdk', _('VMDK - Virtual Machine Disk')),
+#    ],
+#}
+
+# The IMAGE_CUSTOM_PROPERTY_TITLES settings is used to customize the titles for
+# image custom property attributes that appear on image detail pages.
+IMAGE_CUSTOM_PROPERTY_TITLES = {
+    "architecture": _("Architecture"),
+    "kernel_id": _("Kernel ID"),
+    "ramdisk_id": _("Ramdisk ID"),
+    "image_state": _("Euca2ools state"),
+    "project_id": _("Project ID"),
+    "image_type": _("Image Type"),
+}
+
+# The IMAGE_RESERVED_CUSTOM_PROPERTIES setting is used to specify which image
+# custom properties should not be displayed in the Image Custom Properties
+# table.
+IMAGE_RESERVED_CUSTOM_PROPERTIES = []
+
+# Set to 'legacy' or 'direct' to allow users to upload images to glance via
+# Horizon server. When enabled, a file form field will appear on the create
+# image form. If set to 'off', there will be no file form field on the create
+# image form. See documentation for deployment considerations.
+#HORIZON_IMAGES_UPLOAD_MODE = 'legacy'
+
+# Allow a location to be set when creating or updating Glance images.
+# If using Glance V2, this value should be False unless the Glance
+# configuration and policies allow setting locations.
+#IMAGES_ALLOW_LOCATION = False
+
+# A dictionary of default settings for create image modal.
+#CREATE_IMAGE_DEFAULTS = {
+#    'image_visibility': "public",
+#}
 
 # OPENSTACK_ENDPOINT_TYPE specifies the endpoint type to use for the endpoints
 # in the Keystone service catalog. Use this setting when Horizon is running
@@ -194,9 +432,9 @@ OPENSTACK_NEUTRON_NETWORK = {
 # SECONDARY_ENDPOINT_TYPE specifies the fallback endpoint type to use in the
 # case that OPENSTACK_ENDPOINT_TYPE is not present in the endpoints
 # in the Keystone service catalog. Use this setting when Horizon is running
-# external to the OpenStack environment. The default is None.  This
+# external to the OpenStack environment. The default is None. This
 # value should differ from OPENSTACK_ENDPOINT_TYPE if used.
-#SECONDARY_ENDPOINT_TYPE = "publicURL"
+#SECONDARY_ENDPOINT_TYPE = None
 
 # The number of objects (Swift containers/objects or images) to display
 # on a single page before providing a paging element (a "more" link)
@@ -204,19 +442,43 @@ OPENSTACK_NEUTRON_NETWORK = {
 API_RESULT_LIMIT = 1000
 API_RESULT_PAGE_SIZE = 20
 
+# The size of chunk in bytes for downloading objects from Swift
+SWIFT_FILE_TRANSFER_CHUNK_SIZE = 512 * 1024
+
+# The default number of lines displayed for instance console log.
+INSTANCE_LOG_LENGTH = 35
+
+# Specify a maximum number of items to display in a dropdown.
+DROPDOWN_MAX_ITEMS = 30
+
 # The timezone of the server. This should correspond with the timezone
 # of your entire OpenStack installation, and hopefully be in UTC.
 TIME_ZONE = "UTC"
 
 # When launching an instance, the menu of available flavors is
-# sorted by RAM usage, ascending.  Provide a callback method here
-# (and/or a flag for reverse sort) for the sorted() method if you'd
-# like a different behaviour.  For more info, see
+# sorted by RAM usage, ascending. If you would like a different sort order,
+# you can provide another flavor attribute as sorting key. Alternatively, you
+# can provide a custom callback method to use for sorting. You can also provide
+# a flag for reverse sort. For more info, see
 # http://docs.python.org/2/library/functions.html#sorted
-# CREATE_INSTANCE_FLAVOR_SORT = {
-#     'key': my_awesome_callback_method,
-#     'reverse': False,
-# }
+#CREATE_INSTANCE_FLAVOR_SORT = {
+#    'key': 'name',
+#     # or
+#    'key': my_awesome_callback_method,
+#    'reverse': False,
+#}
+
+# Set this to True to display an 'Admin Password' field on the Change Password
+# form to verify that it is indeed the admin logged-in who wants to change
+# the password.
+#ENFORCE_PASSWORD_CHECK = False
+
+# Modules that provide /auth routes that can be used to handle different types
+# of user authentication. Add auth plugins that require extra route handling to
+# this list.
+#AUTHENTICATION_URLS = [
+#    'openstack_auth.urls',
+#]
 
 # The Horizon Policy Enforcement engine uses these values to load per service
 # policy rule files. The content of these files should match the files the
@@ -225,18 +487,43 @@ TIME_ZONE = "UTC"
 
 # Path to directory containing policy.json files
 #POLICY_FILES_PATH = os.path.join(ROOT_PATH, "conf")
-# Map of local copy of service policy files
+
+# Map of local copy of service policy files.
+# Please insure that your identity policy file matches the one being used on
+# your keystone servers. There is an alternate policy file that may be used
+# in the Keystone v3 multi-domain case, policy.v3cloudsample.json.
+# This file is not included in the Horizon repository by default but can be
+# found at
+# http://git.openstack.org/cgit/openstack/keystone/tree/etc/ \
+# policy.v3cloudsample.json
+# Having matching policy files on the Horizon and Keystone servers is essential
+# for normal operation. This holds true for all services and their policy files.
 #POLICY_FILES = {
 #    'identity': 'keystone_policy.json',
-#    'compute': 'nova_policy.json'
+#    'compute': 'nova_policy.json',
+#    'volume': 'cinder_policy.json',
+#    'image': 'glance_policy.json',
+#    'orchestration': 'heat_policy.json',
+#    'network': 'neutron_policy.json',
 #}
 
+# TODO: (david-lyle) remove when plugins support adding settings.
+# Note: Only used when trove-dashboard plugin is configured to be used by
+# Horizon.
 # Trove user and database extension support. By default support for
 # creating users and databases on database instances is turned on.
 # To disable these extensions set the permission here to something
 # unusable such as ["!"].
-# TROVE_ADD_USER_PERMS = []
-# TROVE_ADD_DATABASE_PERMS = []
+#TROVE_ADD_USER_PERMS = []
+#TROVE_ADD_DATABASE_PERMS = []
+
+# Change this patch to the appropriate list of tuples containing
+# a key, label and static directory containing two files:
+# _variables.scss and _styles.scss
+#AVAILABLE_THEMES = [
+#    ('default', 'Default', 'themes/default'),
+#    ('material', 'Material', 'themes/material'),
+#]
 
 LOGGING = {
     'version': 1,
@@ -245,15 +532,35 @@ LOGGING = {
     # if nothing is specified here and disable_existing_loggers is True,
     # django.db.backends will still log unless it is disabled explicitly.
     'disable_existing_loggers': False,
+    # If apache2 mod_wsgi is used to deploy OpenStack dashboard
+    # timestamp is output by mod_wsgi. If WSGI framework you use does not
+    # output timestamp for logging, add %(asctime)s in the following
+    # format definitions.
+    'formatters': {
+        'console': {
+            'format': '%(levelname)s %(name)s %(message)s'
+        },
+        'operation': {
+            # The format of "%(message)s" is defined by
+            # OPERATION_LOG_OPTIONS['format']
+            'format': '%(message)s'
+        },
+    },
     'handlers': {
         'null': {
             'level': 'DEBUG',
-            'class': 'django.utils.log.NullHandler',
+            'class': 'logging.NullHandler',
         },
         'console': {
             # Set the level to "DEBUG" for verbose output logging.
             'level': 'INFO',
             'class': 'logging.StreamHandler',
+            'formatter': 'console',
+        },
+        'operation': {
+            'level': 'INFO',
+            'class': 'logging.StreamHandler',
+            'formatter': 'operation',
         },
     },
     'loggers': {
@@ -272,6 +579,11 @@ LOGGING = {
             'level': 'DEBUG',
             'propagate': False,
         },
+        'horizon.operation_log': {
+            'handlers': ['operation'],
+            'level': 'INFO',
+            'propagate': False,
+        },
         'openstack_dashboard': {
             'handlers': ['console'],
             'level': 'DEBUG',
@@ -307,16 +619,6 @@ LOGGING = {
             'level': 'DEBUG',
             'propagate': False,
         },
-        'ceilometerclient': {
-            'handlers': ['console'],
-            'level': 'DEBUG',
-            'propagate': False,
-        },
-        'troveclient': {
-            'handlers': ['console'],
-            'level': 'DEBUG',
-            'propagate': False,
-        },
         'swiftclient': {
             'handlers': ['console'],
             'level': 'DEBUG',
@@ -341,24 +643,30 @@ LOGGING = {
             'handlers': ['null'],
             'propagate': False,
         },
-    }
+        'scss': {
+            'handlers': ['null'],
+            'propagate': False,
+        },
+    },
 }
 
+# 'direction' should not be specified for all_tcp/udp/icmp.
+# It is specified in the form.
 SECURITY_GROUP_RULES = {
     'all_tcp': {
-        'name': 'ALL TCP',
+        'name': _('All TCP'),
         'ip_protocol': 'tcp',
         'from_port': '1',
         'to_port': '65535',
     },
     'all_udp': {
-        'name': 'ALL UDP',
+        'name': _('All UDP'),
         'ip_protocol': 'udp',
         'from_port': '1',
         'to_port': '65535',
     },
     'all_icmp': {
-        'name': 'ALL ICMP',
+        'name': _('All ICMP'),
         'ip_protocol': 'icmp',
         'from_port': '-1',
         'to_port': '-1',
@@ -448,3 +756,143 @@ SECURITY_GROUP_RULES = {
         'to_port': '3389',
     },
 }
+
+# Deprecation Notice:
+#
+# The setting FLAVOR_EXTRA_KEYS has been deprecated.
+# Please load extra spec metadata into the Glance Metadata Definition Catalog.
+#
+# The sample quota definitions can be found in:
+# <glance_source>/etc/metadefs/compute-quota.json
+#
+# The metadata definition catalog supports CLI and API:
+#  $glance --os-image-api-version 2 help md-namespace-import
+#  $glance-manage db_load_metadefs <directory_with_definition_files>
+#
+# See Metadata Definitions on: http://docs.openstack.org/developer/glance/
+
+# TODO: (david-lyle) remove when plugins support settings natively
+# Note: This is only used when the Sahara plugin is configured and enabled
+# for use in Horizon.
+# Indicate to the Sahara data processing service whether or not
+# automatic floating IP allocation is in effect.  If it is not
+# in effect, the user will be prompted to choose a floating IP
+# pool for use in their cluster.  False by default.  You would want
+# to set this to True if you were running Nova Networking with
+# auto_assign_floating_ip = True.
+#SAHARA_AUTO_IP_ALLOCATION_ENABLED = False
+
+# The hash algorithm to use for authentication tokens. This must
+# match the hash algorithm that the identity server and the
+# auth_token middleware are using. Allowed values are the
+# algorithms supported by Python's hashlib library.
+#OPENSTACK_TOKEN_HASH_ALGORITHM = 'md5'
+
+# AngularJS requires some settings to be made available to
+# the client side. Some settings are required by in-tree / built-in horizon
+# features. These settings must be added to REST_API_REQUIRED_SETTINGS in the
+# form of ['SETTING_1','SETTING_2'], etc.
+#
+# You may remove settings from this list for security purposes, but do so at
+# the risk of breaking a built-in horizon feature. These settings are required
+# for horizon to function properly. Only remove them if you know what you
+# are doing. These settings may in the future be moved to be defined within
+# the enabled panel configuration.
+# You should not add settings to this list for out of tree extensions.
+# See: https://wiki.openstack.org/wiki/Horizon/RESTAPI
+REST_API_REQUIRED_SETTINGS = ['OPENSTACK_HYPERVISOR_FEATURES',
+                              'LAUNCH_INSTANCE_DEFAULTS',
+                              'OPENSTACK_IMAGE_FORMATS',
+                              'OPENSTACK_KEYSTONE_DEFAULT_DOMAIN',
+                              'CREATE_IMAGE_DEFAULTS']
+
+# Additional settings can be made available to the client side for
+# extensibility by specifying them in REST_API_ADDITIONAL_SETTINGS
+# !! Please use extreme caution as the settings are transferred via HTTP/S
+# and are not encrypted on the browser. This is an experimental API and
+# may be deprecated in the future without notice.
+#REST_API_ADDITIONAL_SETTINGS = []
+
+# DISALLOW_IFRAME_EMBED can be used to prevent Horizon from being embedded
+# within an iframe. Legacy browsers are still vulnerable to a Cross-Frame
+# Scripting (XFS) vulnerability, so this option allows extra security hardening
+# where iframes are not used in deployment. Default setting is True.
+# For more information see:
+# http://tinyurl.com/anticlickjack
+#DISALLOW_IFRAME_EMBED = True
+
+# Help URL can be made available for the client. To provide a help URL, edit the
+# following attribute to the URL of your choice.
+#HORIZON_CONFIG["help_url"] = "http://openstack.mycompany.org"
+
+# Settings for OperationLogMiddleware
+# OPERATION_LOG_ENABLED is flag to use the function to log an operation on
+# Horizon.
+# mask_targets is arrangement for appointing a target to mask.
+# method_targets is arrangement of HTTP method to output log.
+# format is the log contents.
+#OPERATION_LOG_ENABLED = False
+#OPERATION_LOG_OPTIONS = {
+#    'mask_fields': ['password'],
+#    'target_methods': ['POST'],
+#    'ignored_urls': ['/js/', '/static/', '^/api/'],
+#    'format': ("[%(client_ip)s] [%(domain_name)s]"
+#        " [%(domain_id)s] [%(project_name)s]"
+#        " [%(project_id)s] [%(user_name)s] [%(user_id)s] [%(request_scheme)s]"
+#        " [%(referer_url)s] [%(request_url)s] [%(message)s] [%(method)s]"
+#        " [%(http_status)s] [%(param)s]"),
+#}
+
+# The default date range in the Overview panel meters - either <today> minus N
+# days (if the value is integer N), or from the beginning of the current month
+# until today (if set to None). This setting should be used to limit the amount
+# of data fetched by default when rendering the Overview panel.
+#OVERVIEW_DAYS_RANGE = 1
+
+# To allow operators to require users provide a search criteria first
+# before loading any data into the views, set the following dict
+# attributes to True in each one of the panels you want to enable this feature.
+# Follow the convention <dashboard>.<view>
+#FILTER_DATA_FIRST = {
+#    'admin.instances': False,
+#    'admin.images': False,
+#    'admin.networks': False,
+#    'admin.routers': False,
+#    'admin.volumes': False,
+#    'identity.users': False,
+#    'identity.projects': False,
+#    'identity.groups': False,
+#    'identity.roles': False
+#}
+
+# Dict used to restrict user private subnet cidr range.
+# An empty list means that user input will not be restricted
+# for a corresponding IP version. By default, there is
+# no restriction for IPv4 or IPv6. To restrict
+# user private subnet cidr range set ALLOWED_PRIVATE_SUBNET_CIDR
+# to something like
+#ALLOWED_PRIVATE_SUBNET_CIDR = {
+#    'ipv4': ['10.0.0.0/8', '192.168.0.0/16'],
+#    'ipv6': ['fc00::/7']
+#}
+ALLOWED_PRIVATE_SUBNET_CIDR = {'ipv4': [], 'ipv6': []}
+
+# Projects and users can have extra attributes as defined by keystone v3.
+# Horizon has the ability to display these extra attributes via this setting.
+# If you'd like to display extra data in the project or user tables, set the
+# corresponding dict key to the attribute name, followed by the display name.
+# For more information, see horizon's customization (http://docs.openstack.org/developer/horizon/topics/customizing.html#horizon-customization-module-overrides)
+#PROJECT_TABLE_EXTRA_INFO = {
+#   'phone_num': _('Phone Number'),
+#}
+#USER_TABLE_EXTRA_INFO = {
+#   'phone_num': _('Phone Number'),
+#}
+
+# Password will have an expiration date when using keystone v3 and enabling the
+# feature.
+# This setting allows you to set the number of days that the user will be alerted
+# prior to the password expiration.
+# Once the password expires keystone will deny the access and users must
+# contact an admin to change their password.
+#PASSWORD_EXPIRES_WARNING_THRESHOLD_DAYS = 0
diff --git a/meta-openstack/recipes-devtools/python/python-horizon/wsgi-horizon.conf b/meta-openstack/recipes-devtools/python/python-horizon/wsgi-horizon.conf
new file mode 100644
index 0000000..9c2111c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-horizon/wsgi-horizon.conf
@@ -0,0 +1,14 @@
+WSGIScriptAlias /horizon %DATADIR%/openstack-dashboard/openstack_dashboard/wsgi/django.wsgi process-group=horizon
+WSGIDaemonProcess horizon user=%USER% group=%GROUP% processes=3 threads=10 display-name=%{GROUP}
+WSGIProcessGroup horizon
+
+Alias /static %LOCALSTATEDIR%/lib/openstack-dashboard/static/
+Alias /horizon/static %LOCALSTATEDIR%/lib/openstack-dashboard/static/
+
+<Directory %DATADIR%/openstack-dashboard/openstack_dashboard/wsgi>
+  Require all granted
+</Directory>
+
+<Directory %LOCALSTATEDIR%/lib/openstack-dashboard/static>
+  Require all granted
+</Directory>
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 51025e7..5e12e87 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -74,18 +74,25 @@ RDEPENDS_${PN} += " \
 SRCNAME = "horizon"
 
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
-    file://horizon.init \
+    file://wsgi-horizon.conf \
     file://fix_bindir_path.patch \
-    file://openstack-dashboard-apache.conf \
     file://local_settings.py \
     file://horizon-use-full-package-path-to-test-directories.patch \
     "
+#    file://openstack-dashboard-apache.conf
 
 SRCREV = "246ff9f81248a00a434e66d18fad70519ba811cc"
 PV = "12.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d python-dir default_configs monitor
+inherit setuptools systemd python-dir default_configs monitor useradd
+
+USER = "horizon"
+GROUP = "horizon"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system ${GROUP}"
+USERADD_PARAM_${PN} = "--system -m -d ${localstatedir}/lib/openstack-dashboard -s /bin/false -g ${GROUP} ${USER}"
 
 # no longer required. kept as reference.
 # do_install[dirs] += "${D}/usr/share/bin"
@@ -94,56 +101,70 @@ do_install_append() {
     SYSCONF_DIR=${D}${sysconfdir}
     DASHBOARD_CONF_DIR=${SYSCONF_DIR}/openstack-dashboard
     DASHBOARD_SHARE_DIR=${D}${datadir}/openstack-dashboard
-    HORIZON_CONF_DIR=${D}${sysconfdir}/horizon
-
-    install -d ${HORIZON_CONF_DIR}
+    APACHE_CONF_DIR=${D}${sysconfdir}/apache2/conf.d/
 
+    # Fixup to allow running standalone. Currently broken.
     DASHBOARD_DIR=${D}${PYTHON_SITEPACKAGES_DIR}/openstack_dashboard
-    sed -e "s:^LANGUAGE_CODE =.*:LANGUAGE_CODE = 'en-us':g" \
-        -i ${DASHBOARD_DIR}/settings.py
-    sed -e "s:^# from horizon.utils:from horizon.utils:g" \
-        ${DASHBOARD_DIR}/local/local_settings.py.example > \
-        ${DASHBOARD_DIR}/local/local_settings.py
-    sed -e "s:^# SECRET_KEY =:SECRET_KEY =:g" \
-        -i ${DASHBOARD_DIR}/local/local_settings.py
+    #sed -e "s:^LANGUAGE_CODE =.*:LANGUAGE_CODE = 'en-us':g" \
+    #    -i ${DASHBOARD_DIR}/settings.py
+    #sed -e "s:^# from horizon.utils:from horizon.utils:g" \
+    #    ${DASHBOARD_DIR}/local/local_settings.py.example > \
+    #    ${DASHBOARD_DIR}/local/local_settings.py
+    #sed -e "s:^# SECRET_KEY =:SECRET_KEY =:g" \
+    #    -i ${DASHBOARD_DIR}/local/local_settings.py
     install -m 644 ${S}/manage.py ${DASHBOARD_DIR}/manage.py
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
-    then
-        install -d ${D}${sysconfdir}/init.d
-        sed 's:@PYTHON_SITEPACKAGES@:${PYTHON_SITEPACKAGES_DIR}:' \
-            ${WORKDIR}/horizon.init >${WORKDIR}/horizon
-        install -m 0755 ${WORKDIR}/horizon ${D}${sysconfdir}/init.d/horizon
-    fi
     sed -i -e 's#%PYTHON_SITEPACKAGES%#${PYTHON_SITEPACKAGES_DIR}#g' \
         ${D}${PYTHON_SITEPACKAGES_DIR}/horizon/test/settings.py
 
     # no longer required. kept as reference.
     # mv ${D}${datadir}/bin ${DASHBOARD_DIR}/bin
 
-    cp run_tests.sh ${HORIZON_CONF_DIR}
+    install -d ${DASHBOARD_CONF_DIR}
+    cp run_tests.sh ${DASHBOARD_CONF_DIR}
 
-    # the following are setup required for horizon-apache
+    # The following allows horizon to be run from apache. This
+    # is the preffered way to run horizon.
     install -d ${DASHBOARD_SHARE_DIR}
     cp -a --no-preserve=ownership ${S}/openstack_dashboard  ${DASHBOARD_SHARE_DIR}
     cp ${S}/manage.py  ${DASHBOARD_SHARE_DIR}
 
-    install -D -m 644 ${WORKDIR}/local_settings.py \
-        ${DASHBOARD_CONF_DIR}/local_settings.py
+    # Copy our version of the local-settings.py file, create a convienence link
+    # between /etc/openstack-dashboard and the apache2 files installed above,
+    # lastly make a few substitions to match our installation locations.
+    SETTINGS_FILE=${DASHBOARD_CONF_DIR}/local_settings.py
+    install -D -m 644 ${WORKDIR}/local_settings.py ${SETTINGS_FILE}
+    # Link only valid on the target.
     ln -fs ${sysconfdir}/openstack-dashboard/local_settings.py \
         ${DASHBOARD_SHARE_DIR}/openstack_dashboard/local/local_settings.py
-
-    install -D -m 644 ${WORKDIR}/openstack-dashboard-apache.conf \
-      ${SYSCONF_DIR}/apache2/conf.d/openstack-dashboard-apache.conf
-    sed -i -e 's#%PYTHON_SITEPACKAGES%#${PYTHON_SITEPACKAGES_DIR}#' \
-        ${SYSCONF_DIR}/apache2/conf.d/openstack-dashboard-apache.conf
-    sed -i -e 's#%LIBDIR%#${libdir}#' \
-        ${SYSCONF_DIR}/apache2/conf.d/openstack-dashboard-apache.conf
+    # Be sure to edit the real file in ${D}${sysconfdir}
+    sed -e "s:%LOCAL_PATH%:${localstatedir}/lib/openstack-dashboard/static:g" \
+        -i ${SETTINGS_FILE}
+
+    # Configure apache to run horizon at http://localhost/horizon
+    install -m 755 -d ${APACHE_CONF_DIR}
+    APACHE_WSGI_FILE=${APACHE_CONF_DIR}/openstack-dashboard.conf
+    install -m 644 ${WORKDIR}/wsgi-horizon.conf ${APACHE_WSGI_FILE}
+    sed -e "s#%DATADIR%#${datadir}#g" -i ${APACHE_WSGI_FILE}
+    sed -e "s#%USER%#${USER}#g" -i ${APACHE_WSGI_FILE}
+    sed -e "s#%GROUP%#${GROUP}#g" -i ${APACHE_WSGI_FILE}
+    sed -e "s#%LOCALSTATEDIR%#${localstatedir}#g" -i ${APACHE_WSGI_FILE}
+
+    #HZ_SETTINGS_FILE=${DASHBOARD_SHARE_DIR}/openstack_dashboard/settings.py
+    #sed -e "s:^\(WEBROOT\ =\ \).*$:\1'/horizon':" -i ${HZ_SETTINGS_FILE}
+    #sed -e "s:^\(STATIC_ROOT\ =\ \).*$:\1'${localstatedir}/lib/openstack-dashboard/static':" \
+    #    -i ${HZ_SETTINGS_FILE}
 
     ln -fs openstack_dashboard/static ${DASHBOARD_SHARE_DIR}/static
+}
 
-    # daemon is UID 1
-    chown -R 1 ${DASHBOARD_SHARE_DIR}/openstack_dashboard/static
+pkg_postinst_${SRCNAME} () {
+    if [ -n "$D" ]; then
+        exit 1
+    else
+        # Regenerate the django static files
+        sudo -u horizon /usr/bin/env python ${datadir}/openstack-dashboard/manage.py collectstatic --noinput --clear 
+    fi
 }
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-apache ${SRCNAME}-standalone"
@@ -153,7 +174,7 @@ RDEPENDS_${SRCNAME}-tests += " bash"
 
 FILES_${PN} = "${libdir}/*"
 
-FILES_${SRCNAME}-tests = "${sysconfdir}/${SRCNAME}/run_tests.sh"
+FILES_${SRCNAME}-tests = "${sysconfdir}/openstack-dashboard/run_tests.sh"
 
 FILES_${SRCNAME} = "${bindir}/* \
     ${datadir}/* \
@@ -179,10 +200,6 @@ RDEPENDS_${PN} += " \
 
 RDEPENDS_${SRCNAME} = "${PN}"
 
-INITSCRIPT_PACKAGES = "${SRCNAME}"
-INITSCRIPT_NAME_${SRCNAME} = "horizon"
-INITSCRIPT_PARAMS_${SRCNAME} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
-
 RDEPENDS_${SRCNAME}-apache = "\
     apache2 \
     mod-wsgi \
-- 
2.7.4


