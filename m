Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66974E00CF1; Fri, 17 Nov 2017 08:11:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 237C4E00CEC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Nov 2017 08:11:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAHGB4Dw008361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Nov 2017 08:11:04 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 17 Nov 2017 08:11:02 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510860042-2320-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b3474cea-a9e2-30ca-83d3-27a0bc171e41@windriver.com>
Date: Fri, 17 Nov 2017 11:11:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510860042-2320-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH] python-*: switch remaining (https) pypi recipes to use the pypi class
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
X-List-Received-Date: Fri, 17 Nov 2017 16:11:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 02:20 PM, Mark Asselstine wrote:
> The original commit to switch pypi recipes to use the pypi.bbclass
> only addressed the urgent need to get the recipes using "http"
> converted. This change is the same but converts the remaining pypi
> recipes which were already uing "https".
> 
> Cleanup the various python-* recipes which download from pypi. The
> biggest change is to "inherit pypi" which should result in us always
> using current pypi best practices. This will for example ensure we are
> using https and not http which is apparently going to be disabled
> soon.
> 
> In most cases we are able to drop SRC_URI, however, for some recipes
> which use 'zip' or 'bz2' extensions we need to set PYPI_PACKAGE_EXT.
> 
> In all cases we can drop the defining of 'S' and 'PR' as the pypi
> class and the PR server will set these correctly.
> 
> In most cases we can drop SRCNAME. Where needed we instead set
> PYPI_PACKAGE to overwrite the derived name that the pypi class would
> otherwise calculate.

merged.

Bruce

> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../recipes-devtools/python/python-aioeventlet_0.4.bb       |  8 ++------
>   .../recipes-devtools/python/python-alembic_0.8.10.bb        |  8 +-------
>   .../recipes-devtools/python/python-automaton_0.8.0.bb       |  8 +-------
>   .../recipes-devtools/python/python-babel_2.3.4.bb           |  8 ++------
>   .../recipes-devtools/python/python-beautifulsoup4_4.4.1.bb  |  9 +--------
>   .../recipes-devtools/python/python-contextlib2_0.4.0.bb     |  8 +-------
>   .../recipes-devtools/python/python-debtcollector_1.10.0.bb  |  8 +-------
>   .../recipes-devtools/python/python-django-appconf_1.0.1.bb  | 10 +---------
>   .../recipes-devtools/python/python-django-compressor_2.1.bb |  9 ++-------
>   .../recipes-devtools/python/python-dogpile.cache_0.6.2.bb   |  8 +-------
>   .../recipes-devtools/python/python-dogpile.core_0.4.1.bb    |  9 +--------
>   meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb |  8 +-------
>   .../recipes-devtools/python/python-extras_1.0.0.bb          |  9 +--------
>   .../recipes-devtools/python/python-fixtures_3.0.0.bb        |  8 +-------
>   .../recipes-devtools/python/python-flake8_2.4.0.bb          |  8 +-------
>   .../recipes-devtools/python/python-funcsigs_1.0.2.bb        |  8 +-------
>   .../recipes-devtools/python/python-futurist_0.21.0.bb       |  8 +-------
>   .../recipes-devtools/python/python-happybase_1.1.0.bb       |  9 +--------
>   .../recipes-devtools/python/python-hgtools_6.3.bb           |  9 ++-------
>   .../recipes-devtools/python/python-hp3parclient_3.2.0.bb    | 10 ++--------
>   .../recipes-devtools/python/python-httplib2_0.10.3.bb       |  8 +-------
>   .../recipes-devtools/python/python-httpretty_0.8.14.bb      | 10 +---------
>   .../recipes-devtools/python/python-jinja2_2.7.3.bb          |  9 ++-------
>   .../recipes-devtools/python/python-keyring_5.3.bb           |  9 ++-------
>   .../recipes-devtools/python/python-lesscpy_0.10.2.bb        |  9 +--------
>   .../recipes-devtools/python/python-lockfile_0.12.2.bb       |  8 +-------
>   .../recipes-devtools/python/python-logutils_0.3.5.bb        |  9 +--------
>   meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb |  9 ++-------
>   .../recipes-devtools/python/python-markupsafe_0.18.bb       |  9 ++-------
>   .../recipes-devtools/python/python-mccabe_0.2.1.bb          |  9 +--------
>   .../recipes-devtools/python/python-mimeparse_0.1.4.bb       |  8 ++------
>   meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb |  9 +--------
>   .../recipes-devtools/python/python-mox3_0.20.0.bb           |  9 +--------
>   meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb  |  9 +--------
>   .../recipes-devtools/python/python-netaddr_0.7.19.bb        |  8 +-------
>   .../recipes-devtools/python/python-netifaces_0.10.4.bb      |  9 +--------
>   .../recipes-devtools/python/python-oauth2_1.5.211.bb        |  9 +--------
>   meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb  |  9 +--------
>   .../recipes-devtools/python/python-paramiko_2.4.0.bb        |  9 +--------
>   .../recipes-devtools/python/python-passlib_1.6.2.bb         |  9 +--------
>   .../recipes-devtools/python/python-paste_2.0.2.bb           |  8 ++------
>   .../recipes-devtools/python/python-pastedeploy_1.5.2.bb     |  9 ++-------
>   .../recipes-devtools/python/python-pecan_1.2.1.bb           | 10 +---------
>   meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb |  9 +--------
>   .../recipes-devtools/python/python-pexpect_3.3.bb           |  7 +------
>   .../recipes-devtools/python/python-pika-pool_0.1.3.bb       |  8 +-------
>   meta-openstack/recipes-devtools/python/python-ply_3.4.bb    |  9 +--------
>   .../recipes-devtools/python/python-positional_1.1.1.bb      |  8 +-------
>   .../recipes-devtools/python/python-psycopg2_2.6.2.bb        |  9 ++-------
>   .../recipes-devtools/python/python-pycrypto_2.6.1.bb        | 13 ++++---------
>   .../recipes-devtools/python/python-pyflakes_0.7.3.bb        |  9 +--------
>   .../recipes-devtools/python/python-pymongo_3.4.0.bb         |  8 +-------
>   .../recipes-devtools/python/python-pysnmp_4.2.5.bb          | 10 +---------
>   .../recipes-devtools/python/python-pytz_2013.8.bb           | 10 +---------
>   .../recipes-devtools/python/python-pyudev_0.16.1.bb         |  9 +--------
>   .../recipes-devtools/python/python-rcssmin_1.0.6.bb         |  9 +--------
>   .../recipes-devtools/python/python-rjsmin_1.0.12.bb         |  9 +--------
>   .../recipes-devtools/python/python-setuptools-git_1.1.bb    |  8 +-------
>   .../recipes-devtools/python/python-simplegeneric_0.8.1.bb   |  9 ++-------
>   .../python/python-singledispatch_3.4.0.3.bb                 |  8 +-------
>   .../recipes-devtools/python/python-subunit_1.1.0.bb         |  8 ++------
>   .../recipes-devtools/python/python-suds-jurko_0.6.bb        |  8 ++------
>   .../recipes-devtools/python/python-tempita_0.5.3dev.bb      |  8 ++------
>   .../recipes-devtools/python/python-termcolor_1.1.0.bb       | 10 +---------
>   .../recipes-devtools/python/python-testrepository_0.0.20.bb |  9 +--------
>   .../recipes-devtools/python/python-testresources_0.2.7.bb   |  9 +--------
>   .../recipes-devtools/python/python-testscenarios_0.5.0.bb   |  9 +--------
>   .../recipes-devtools/python/python-testtools_2.2.0.bb       |  9 +--------
>   .../recipes-devtools/python/python-thrift_0.9.2.bb          |  8 +-------
>   .../recipes-devtools/python/python-waitress_1.0.1.bb        |  8 +-------
>   .../recipes-devtools/python/python-warlock_1.3.0.bb         |  8 +-------
>   .../recipes-devtools/python/python-webtest_2.0.21.bb        |  8 ++------
>   meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb |  8 ++------
>   .../recipes-devtools/python/python-xattr_0.6.4.bb           | 10 +---------
>   .../python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb   |  8 ++------
>   .../recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb  |  7 ++-----
>   76 files changed, 100 insertions(+), 561 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb b/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
> index 0841b9b..4cf2ae5 100644
> --- a/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
> @@ -4,18 +4,14 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8f7bb094c7232b058c7e9f2e431f389c"
>   
> -SRCNAME = "aioeventlet"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI += " \
>       file://Makefile-skip-building-docs.patch \
>       "
>   
>   SRC_URI[md5sum] = "678ea30265ae0326bddc767f80efd144"
>   SRC_URI[sha256sum] = "fe78c2b227ce077b1581e2ae2c071f351111d0878ec1b0216435f6a898df79a6"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> index 69fa495..5a377d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> +++ b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d07407716fd24408b5747b0fa2262775"
>   
> -SRCNAME = "alembic"
> -
> -SRC_URI = "https://pypi.io/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "21b344a70ce637699c18bf074a080649"
>   SRC_URI[sha256sum] = "0e3b50e96218283ec7443fb661199f5a81f5879f766967a8a2d25e8f9d4e7919"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>       python-sqlalchemy \
> diff --git a/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
> index 185a7a5..c7e4dda 100644
> --- a/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>   
> -SRCNAME = "automaton"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "230a7bd8bb9a4bc9ba5a3faf0de12c90"
>   SRC_URI[sha256sum] = "ca8bfbea03b9f39a536b4b261d90fbe8b1b0e1766bff5d8222e35691f8e11910"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> index 790491d..e4c0884 100644
> --- a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
>   
> -SRCNAME = "Babel"
> -SRC_URI = "https://pypi.io/packages/source/B/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> +PYPI_PACKAGE = "Babel"
>   
>   SRC_URI[md5sum] = "afa20bc55b0e991833030129ad498f35"
>   SRC_URI[sha256sum] = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   CLEANBROKEN = "1"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
> index 1e061c2..cb72f87 100644
> --- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=39dacabe5494f61c8680f6fa7323b596"
>   
> -PR = "r0"
> -SRCNAME = "beautifulsoup4"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "8fbd9a7cac0704645fa20d1419036815"
>   SRC_URI[sha256sum] = "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # avoid "error: option --single-version-externally-managed not recognized"
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
> index 2bede47..960238d 100644
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
>   
> -SRCNAME = "contextlib2"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ea687207db25f65552061db4a2c6727d"
>   SRC_URI[sha256sum] = "55a5dc78f7a742a0e756645134ffb39bbe11da0fea2bc0f7070d40dac208b732"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb
> index bdb36f9..d53960c 100644
> --- a/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   
> -SRCNAME = "debtcollector"
> -
> -SRC_URI = "https://pypi.io/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c85d9e0e7d4d00577695214cb425c5b4"
>   SRC_URI[sha256sum] = "1a3bd886d6aea3775e5366d7335c856449144c0218209af6c660f6be111714a3"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
> index 49e2edf..2eed747 100644
> --- a/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django-appconf_1.0.1.bb
> @@ -4,18 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3f34b9b2f6413fd5f91869fa7e992457"
>   
> -PR = "r0"
> -SRCNAME = "django-appconf"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "29c87a00f0d098b90f3ac6113ae6e52d"
>   SRC_URI[sha256sum] = "ba1375fb1024e8e91547504d4392321795c989fde500b96ebc7c93884f786e60"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   #RDEPENDS_${PN} += "python-six \
>   #	"
> diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
> index 4bdb706..c546c85 100644
> --- a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=021598d037fd39ab02e53249e1fe4b6f"
>   
> -SRCNAME = "django_compressor"
> -
> -SRC_URI = "https://pypi.io/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> +PYPI_PACKAGE = "django_compressor"
>   
>   SRC_URI[md5sum] = "21ecfe4e8615eae64f7068a5599df9af"
>   SRC_URI[sha256sum] = "ae0051bc0c7a0660c93434e68d617553fccdd573293dfd15aa33f78d2b4954ef"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>           python-django-appconf  \
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
> index c1827bc..632061b 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
> @@ -4,15 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1edd9b48649f5bffa03e749a55f5a067"
>   
> -SRCNAME = "dogpile.cache"
> -
> -SRC_URI = "https://pypi.io/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ab3771eb2155b9658c9e33fa1b827708"
>   SRC_URI[sha256sum] = "73793471af07af6dc5b3ee015abfaca4220caaa34c615537f5ab007ed150726d"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> index 0b33455..9e36074 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> @@ -4,16 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0401fd56584d7b3d4be91690672ec433"
>   
> -PR = "r0"
> -SRCNAME = "dogpile.core"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "01cb19f52bba3e95c9b560f39341f045"
>   SRC_URI[sha256sum] = "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3743a863cc9dbed76"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb b/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
> index bb11fb1..8fe492c 100644
> --- a/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   
> -SRCNAME = "ecdsa"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "1f60eda9cb5c46722856db41a3ae6670"
>   SRC_URI[sha256sum] = "64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac223d57ad800c43fa"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> index cc99cc6..6d75324 100644
> --- a/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
>   
> -PR = "r0"
> -SRCNAME = "extras"
> -
> -SRC_URI = "https://pypi.python.org/packages/be/18/0b7283f0ebf6ad4bb6b9937538495eadf05ef097b102946b9445c4242636/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
>   SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
> index 25647ec..dc03a5b 100644
> --- a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
>   
> -SRCNAME = "fixtures"
> -
> -SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "cd6345b497a62fad739efee66346c2e0"
>   SRC_URI[sha256sum] = "fcf0d60234f1544da717a9738325812de1f42c2fa085e2d9252d8fff5712b2ef"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
>       --prefix=${prefix} \
> diff --git a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
> index 7a065b9..e3c2479 100644
> --- a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7a76e57e683629e1ac2a49406169c2a3"
>   
> -SRCNAME = "flake8"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "d413935bb21026c18aca82654114502f"
>   SRC_URI[sha256sum] = "d26a9d0252da9f831b8277b824961bb10b1f9d79f4752d32e4814b7bcd1e089b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
> index 07f53da..f682452 100644
> --- a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
> @@ -4,15 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
>   
> -SRCNAME = "funcsigs"
> -SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
>   SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> index 27f2860..afee162 100644
> --- a/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   
> -SRCNAME = "futurist"
> -
> -SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "da7e87d273f1982c24e9fe8a24f81259"
>   SRC_URI[sha256sum] = "086dd646c067d4ef6dc9c04000828acfbdc00842bd37c64825b596a6976509b4"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> index 03ebd14..7b3c7d8 100644
> --- a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
>   
> -PR = "r0"
> -SRCNAME = "happybase"
> -
> -SRC_URI = "https://pypi.python.org/packages/8d/a4/9c1202ad4276d4e845594d534397c07082b90aee68c67f378fac38629e6f/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "62a09c784a65161e9f5f01129d115457"
>   SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234fa22481"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   do_install_append() {
>   	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> diff --git a/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb b/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
> index 008d476..1df77b2 100644
> --- a/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-hgtools_6.3.bb
> @@ -4,15 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a428d7abf1504d4dfeb4cbde155ba484"
>   
> -PR = "r0"
> -SRCNAME = "hgtools"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +PYPI_PACKAGE_EXT = "zip"
>   
>   SRC_URI[md5sum] = "584d74b81b1efae3604c53086d1a3acb"
>   SRC_URI[sha256sum] = "1d0ef6ceaba1673e6923b17d7f09c5ae2f4394d16ef80562812987a27e7836ff"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb b/meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb
> index 427e76a..2b8a548 100644
> --- a/meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb
> @@ -4,17 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=497435a85c6b1376c82b18488e9bc907"
>   
> -PR = "r0"
> -SRCNAME = "hp3parclient"
> -
> -SRC_URI = "\
> -	https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI += " \
>   	file://fix_hp3parclient_memory_leak.patch \
>   	"
>   
>   SRC_URI[md5sum] = "f4cc346281ae86c21b5f975cc3b4d759"
>   SRC_URI[sha256sum] = "83c0c00a5ba9fd5cecf6f32c6aea9d222e34abcb521548988b70ac8d062ec2f2"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> index e2b27e7..c5ced3f 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=41a98bc55b04b2a38acdb5c8ab0ae6b2"
>   
> -SRCNAME = "httplib2"
> -
> -SRC_URI = "https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "709c305e1b00e9c0af49ee816429569c"
>   SRC_URI[sha256sum] = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   do_install_append() {
>   	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> index 4fd783d..a315fff 100644
> --- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> @@ -7,18 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=88d874c445b42d9bcea5d211bbc6b8bd"
>   
> -PR = "r0"
> -SRCNAME = "httpretty"
> -
> -SRC_URI = "https://pypi.python.org/packages/7c/7d/fdc08c3ecc0d49cb95cb67fd03034915e0f8d714b18f4d739c062a10a95c/${SRCNAME}-${PV}.tar.gz \
> -          "
> -
>   SRC_URI[md5sum] = "2a6bbf270fafc77647b0479d95d0544c"
>   SRC_URI[sha256sum] = "83c176bbac9d68a45a5cca54f2d5be7e6b16a063adf6f334e7fd0eee272e976e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> index 246d718..4ffa968 100644
> --- a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
>   
> -PR = "r0"
> -SRCNAME = "Jinja2"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/J/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Jinja2"
>   
>   SRC_URI[md5sum] = "b9dffd2f3b43d673802fe857c8445b1a"
>   SRC_URI[sha256sum] = "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-io \
>                      python-pickle \
> diff --git a/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb b/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
> index ea2865e..589fdef 100644
> --- a/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
> @@ -4,16 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://CONTRIBUTORS.txt;md5=50793e96bcc5250698eddfef509a2061"
>   
> -PR = "r0"
> -SRCNAME = "keyring"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +PYPI_PACKAGE_EXT = "zip"
>   
>   SRC_URI[md5sum] = "fd50a2be4a44a78efb09a7c046b6410d"
>   SRC_URI[sha256sum] = "ac2b4dc17e6edfb804b09ade15df79f251522e442976ea0c8ea0051474502cf5"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " python-hgtools"
> diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> index 71e0dc0..ca27cb5 100644
> --- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> @@ -4,20 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a01aae31681ac25b4c46f98d627b9b5d"
>   
> -SRCNAME = "lesscpy"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -           "
> -
>   DEPENDS += "python-ply"
>   RDEPENDS_${PN} += "python-ply"
>   
>   SRC_URI[md5sum] = "fedbad1f4eb19c3af37f09560156246d"
>   SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f1541859318ed9055"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
>       --prefix=${prefix} \
> diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
> index 98f2f98..6191577 100644
> --- a/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
>   
> -SRCNAME = "lockfile"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/l/lockfile/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
>   SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DEPENDS += "\
>       python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> index 80c9490..51177b3 100644
> --- a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
>   
> -PR = "r0"
> -SRCNAME = "logutils"
> -
> -SRC_URI = "https://pypi.python.org/packages/49/b2/b57450889bf73da26027f8b995fd5fbfab258ec24ef967e4c1892f7cb121/logutils-0.3.5.tar.gz"
> -
>   SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
>   SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # avoid "error: option --single-version-externally-managed not recognized"
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
> diff --git a/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb
> index 258d869..7fcbb01 100644
> --- a/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mako_0.8.1.bb
> @@ -4,14 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
>   
> -PR = "r0"
> -SRCNAME = "Mako"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Mako"
>   
>   SRC_URI[md5sum] = "96d962464ce6316004af0cc48495d73e"
>   SRC_URI[sha256sum] = "4791be305338b1fbe09054ec42fb606856599cdcdcde6f348858c13b5fa29158"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> index fc14a51..4551d46 100644
> --- a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> +++ b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
>   
> -PR = "r0"
> -SRCNAME = "MarkupSafe"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "MarkupSafe"
>   
>   SRC_URI[md5sum] = "f8d252fd05371e51dec2fe9a36890687"
>   SRC_URI[sha256sum] = "b7d5d688bdd345bfa897777d297756688cf02e1b3742c56885e2e5c2b996ff82"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-re"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> index 30c47e8..fac44d9 100644
> --- a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
>   
> -PR = "r0"
> -SRCNAME = "mccabe"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
>   SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb b/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
> index c3e6780..1ab4242 100644
> --- a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README;md5=07e6feb820fbca7eb99538badb3cd8e2"
>   
> -SRCNAME = "python-mimeparse"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz "
> +PYPI_PACKAGE = "python-mimeparse"
>   
>   SRC_URI[md5sum] = "1d2816a16f17dcfe0c613da611fe7e13"
>   SRC_URI[sha256sum] = "3c69a21e37e77f754e6fc09ebda70acd92c90d8a58f29a41cc0248351378ddc3"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
>       --prefix=${prefix} \
> diff --git a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> index b17b3f0..d3da911 100644
> --- a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
>   
> -PR = "r0"
> -SRCNAME = "mock"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
>   SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> index 893978b..95ed6e1 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -PR = "r0"
> -
> -SRCNAME = "mox3"
> -SRC_URI = "https://pypi.python.org/packages/d8/a8/64e78823c52d719181100e9e01dd3485a6e064e79e402089ba4e33cfaed6/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
>   SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186fe2cc323d30c3987df50eceb77273595606"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += "\
>       python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb b/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> index 2c665c6..15c2af6 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -PR = "r0"
> -SRCNAME = "mox"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "6de7371e7e8bd9e2dad3fef2646f4a43"
>   SRC_URI[sha256sum] = "424ee725ee12652802b4e86571f816059b0d392401ceae70bf6487d65602cba9"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DISTUTILS_INSTALL_ARGS = "--root=${D} \
>       --prefix=${prefix} \
> diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> index d3d83a1..1b50587 100644
> --- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> +++ b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
>   
> -SRCNAME = "netaddr"
> -
> -SRC_URI = "https://pypi.io/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
>   SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb
> index 5ed80e3..9e0e1fe 100644
> --- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.4.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   
> -PR = "r0"
> -SRCNAME = "netifaces"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "36da76e2cfadd24cc7510c2c0012eb1e"
>   SRC_URI[sha256sum] = "9656a169cb83da34d732b0eb72b39373d48774aee009a3d1272b7ea2ce109cde"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
> index 8700a48..21a0585 100644
> --- a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=15c871e114b5cb956dacad28f4db57c7"
>   
> -PR = "r0"
> -SRCNAME = "oauth2"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "987ad7365a70e2286bd1cebb344debbc"
>   SRC_URI[sha256sum] = "82a38f674da1fa496c0fc4df714cbb058540bed72a30c50a2e344b0d984c4d21"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb b/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> index 366046c..c818d5f 100644
> --- a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://setup.py;beginline=13;endline=13;md5=8ecc573c355c5eb26b2a4a4f3f62684d"
>   
> -PR = "r0"
> -SRCNAME = "pam"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "4c5247af579352bb6882dac64be10a33"
>   SRC_URI[sha256sum] = "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640af1597c2a1dde226b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> index 52d0cda..45ad5d0 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> @@ -4,16 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>   
> -PR = "r0"
> -SRCNAME = "paramiko"
> -
> -SRC_URI = "https://pypi.python.org/packages/c8/de/791773d6a4b23327c7475ae3d7ada0d07fa147bf77fb6f561a4a7d8afd11/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ed6d085a5e5369817e49cf1315b32eba"
>   SRC_URI[sha256sum] = "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-pycrypto"
> diff --git a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb b/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> index 43d6016..78f9b01 100644
> --- a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ec76a9db3f987418e132c0f0210e5ab1"
>   
> -PR = "r0"
> -SRCNAME = "passlib"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "2f872ae7c72ca338634c618f2cff5863"
>   SRC_URI[sha256sum] = "e987f6000d16272f75314c7147eb015727e8532a3b747b1a8fb58e154c68392d"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> index 0833612..d20283c 100644
> --- a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> @@ -4,13 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
>   
> -SRCNAME = "Paste"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Paste"
>   
>   SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
>   SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb b/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
> index 246ade2..c908ccd 100644
> --- a/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pastedeploy_1.5.2.bb
> @@ -4,16 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
>   
> -PR = "r0"
> -SRCNAME = "PasteDeploy"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "PasteDeploy"
>   
>   SRC_URI[md5sum] = "352b7205c78c8de4987578d19431af3b"
>   SRC_URI[sha256sum] = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-paste"
> diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
> index d3df883..656bb02 100644
> --- a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
> @@ -4,18 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
>   
> -PR = "r0"
> -SRCNAME = "pecan"
> -
> -SRC_URI = "https://pypi.python.org/packages/27/b2/eaa47baa88c848ea748e1583246c55466b3ba087cd413fc9a3cd51a6c5f5/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "d0ad387dbc77d1803ad3573fe38a4e0a"
>   SRC_URI[sha256sum] = "8d95457b9cedcfda9b467f5cc7dde8cdf72ddba6b402d6a5902843d1b2186c46"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} = "python-webob \
>                     python-mako \
> diff --git a/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb b/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb
> index 723bec3..a0f91a7 100644
> --- a/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
>   
> -PR = "r0"
> -SRCNAME = "pep8"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
>   SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb b/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> index 8ab8f6d..8b93fdf 100644
> --- a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> @@ -2,12 +2,8 @@ SUMMARY = "A Pure Python Expect like Module for Python"
>   SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c25d9a0770ba69a9965acc894e9f3644"
> -SRCNAME = "pexpect"
>   
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   RDEPENDS_${PN} = "\
>       python-core \
> @@ -17,6 +13,5 @@ RDEPENDS_${PN} = "\
>       python-fcntl \
>   "
>   
> -
>   SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
>   SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
> diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
> index 2cac89e..bfd282b 100644
> --- a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
> @@ -5,16 +5,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
>   
> -SRCNAME = "pika-pool"
> -
> -SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>   SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
>   SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
>   
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>       python-pika \
> diff --git a/meta-openstack/recipes-devtools/python/python-ply_3.4.bb b/meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> index 7f8acd1..a73e6c3 100644
> --- a/meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README;beginline=3;endline=30;md5=36197c7ddf450a50a52cf6e743196b1d"
>   
> -PR = "r0"
> -SRCNAME = "ply"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ffdc95858819347bf92d7c2acc074894"
>   SRC_URI[sha256sum] = "af435f11b7bdd69da5ffbc3fecb8d70a7073ec952e101764c88720cdefb2546b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> index c2dc44c..aee73f6 100644
> --- a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
>   
> -SRCNAME = "positional"
> -SRC_URI = "https://pypi.io/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
>   SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   CLEANBROKEN = "1"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> index 2cdb138..37a4bdd 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.6.2.bb
> @@ -5,19 +5,14 @@ LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2c9872d13fa571e7ba6de95055da1fe2"
>   DEPENDS = "postgresql"
>   
> -PR = "r0"
> -SRCNAME = "psycopg2"
> -
> -SRC_URI = "https://pypi.python.org/packages/7b/a8/dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI += " \
>              file://remove-pg-config.patch \
>             "
>   
>   SRC_URI[md5sum] = "4a392949ba31a378a18ed3e775a4693f"
>   SRC_URI[sha256sum] = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DEPENDS += " \
>       postgresql \
> diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> index b823224..fc91074 100644
> --- a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> @@ -4,24 +4,19 @@ SECTION = "devel/python"
>   LICENSE = "PSFv2"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
>   
> -SRCNAME = "pycrypto"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -           file://cross-compiling.patch"
> +SRC_URI += " \
> +    file://cross-compiling.patch \
> +"
>   
>   SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
>   SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> -
>   export STAGING_INCDIR
>   export STAGING_LIBDIR
>   export BUILD_SYS
>   export HOST_SYS
>   
> -inherit autotools autotools-brokensep distutils
> +inherit autotools autotools-brokensep distutils pypi
>   
>   DEPENDS += " gmp"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> index af7a7f3..81bca36 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
>   
> -PR = "r0"
> -SRCNAME = "pyflakes"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
>   SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-prettytable \
>               python-cmd2 \
> diff --git a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb b/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> index 7916613..34dc076 100644
> --- a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> @@ -3,14 +3,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/pymongo/"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
> -
> -SRCNAME = "pymongo"
> -
> -SRC_URI = "https://pypi.python.org/packages/82/26/f45f95841de5164c48e2e03aff7f0702e22cef2336238d212d8f93e91ea8/${SRCNAME}-${PV}.tar.gz"
>    
>   SRC_URI[md5sum] = "aa77f88e51e281c9f328cea701bb6f3e"
>   SRC_URI[sha256sum] = "d359349c6c9ff9f482805f89e66e476846317dc7b1eea979d7da9c0857ee2721"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> index c02ec6c..dc2f5bf 100644
> --- a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> @@ -4,18 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
>   
> -PR = "r0"
> -SRCNAME = "pysnmp"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "1f75d3e392a050e84348904fc1be3212"
>   SRC_URI[sha256sum] = "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b4b4d897150f7077f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-pycrypto \
>                      python-pyasn1 \
> diff --git a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> index cee4fc2..485c4ff 100644
> --- a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> @@ -4,15 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
>   
> -PR = "r0"
> -SRCNAME = "pytz"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "37750ca749ed3a52523b9682b0b7e381"
>   SRC_URI[sha256sum] = "58552e870aa2c0a1fa3b4ef923f00fbf3e55afaa87f8d31244d44f188de4793a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> index 384b1d8..39f725d 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>   
> -PR = "r0"
> -SRCNAME = "pyudev"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "4034de584b6d9efcbfc590a047c63285"
>   SRC_URI[sha256sum] = "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c03538bcc4c735ff1c95"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> index 6d412cc..e1b4a55 100644
> --- a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRCNAME = "rcssmin"
> -
> -SRC_URI = "https://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
>   SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>           "
> diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> index 145eea0..508390a 100644
> --- a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRCNAME = "rjsmin"
> -
> -SRC_URI = "https://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
>   SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
>   SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>           "
> diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> index 61408c3..bfbc1d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
>   
> -SRCNAME = "setuptools-git"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "7b5967e9527c789c3113b07a1f196f6e"
>   SRC_URI[sha256sum] = "047d7595546635edebef226bc566579d422ccc48a8a91c7d32d8bd174f68f831"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # conflicting file prevention
>   do_install_append() {
> diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> index b2b8e1c..35c0555 100644
> --- a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> @@ -4,14 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
>   
> -PR = "r0"
> -SRCNAME = "simplegeneric"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +PYPI_PACKAGE_EXT = "zip"
>   
>   SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
>   SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> index 4ae7b56..1c92a99 100644
> --- a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
>   
> -SRCNAME = "singledispatch"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
>   SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
> index b775dff..e7c6828 100644
> --- a/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
> @@ -4,13 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
>   
> -SRCNAME = "python-subunit"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "python-subunit"
>   
>   SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
>   SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> index eeab977..a4a436f 100644
> --- a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
>   
> -SRCNAME = "suds-jurko"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.bz2"
> +PYPI_PACKAGE_EXT = "tar.bz2"
>   
>   SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
>   SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
> index 6059ff0..31d5ddc 100644
> --- a/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
> +++ b/meta-openstack/recipes-devtools/python/python-tempita_0.5.3dev.bb
> @@ -4,13 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://setup.py;beginline=33;endline=33;md5=2d33c00f47720c7e35e1fdb4b9fab027"
>   
> -SRCNAME = "Tempita"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/T/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Tempita"
>   
>   SRC_URI[md5sum] = "365c3b4f36435e2178902d5619301140"
>   SRC_URI[sha256sum] = "38392bb708a10128419f75fa9120a6d2c8d137013b353968e5008a77a5c7a2ca"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb
> index d365d61..20b8e2c 100644
> --- a/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb
> @@ -7,18 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
>   
> -PR = "r0"
> -SRCNAME = "termcolor"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
> -
>   SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
>   SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb b/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
> index edb6fe8..79be868 100644
> --- a/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f19071a777e237c55ec3ab83284b31b8"
>   
> -SRCNAME = "testrepository"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "f648b0aceeca4fcd5f8a62eeedea289b"
>   SRC_URI[sha256sum] = "752449bc98c20253ec4611c40564aea93d435a5bf3ff672208e01cc10e5858eb"
>   
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-subunit \
>                      python-extras \
> diff --git a/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.bb b/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.bb
> index c90062e..fe8dbb1 100644
> --- a/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testresources_0.2.7.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README;md5=038679cd2cf27bb2acc70257bfee0f41"
>   
> -PR = "r0"
> -SRCNAME = "testresources"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "db2e774be2a6f5754cbbf4c537f823d0"
>   SRC_URI[sha256sum] = "ad0a117383dd463827b199eaa92829b4d6a3147fbd97459820df53bae81d7231"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> index a777b31..18971d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
>   
> -PR = "r0"
> -
> -SRCNAME = "testscenarios"
> -SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
>   SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += "\
>       python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> index 7c6baed..af93ea8 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
>   
> -PR = "r0"
> -SRCNAME = "testtools"
> -
> -SRC_URI = "https://pypi.python.org/packages/0d/72/3212c1723d49f5b58fca736dabdd2e74f38435076d943f4a642117f04d65/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
>   SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   DEPENDS += " \
>       python-pbr \
>       "
> diff --git a/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
> index ec2ea0c..e8fea35 100644
> --- a/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-thrift_0.9.2.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
>   
> -SRCNAME = "thrift"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
>   SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> index 42c9b9f..49c637b 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>   
> -SRCNAME = "waitress"
> -
> -SRC_URI = "https://pypi.python.org/packages/78/7d/84d11b96c3f60164dec3bef4a859a03aeae0231aa93f57fbe0d05fa4ff36/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "dda92358a7569669086155923a46e57c"
>   SRC_URI[sha256sum] = "2daacaece189ede6a23440afe03bda58089a6207f1d80a1e9497f979dfb741fc"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> index 6a884df..a62cbd8 100644
> --- a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> @@ -6,16 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
>   DEPENDS += "python-jsonschema python-jsonpatch"
>   
> -SRCNAME = "warlock"
> -
> -SRC_URI = "https://pypi.python.org/packages/2d/40/9f01a5e1574dab946598793351d59c86f58209d182d229aaa545abb98894/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "61cc809a3af2c76288f4dd26a003932d"
>   SRC_URI[sha256sum] = "d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6005b9c1962b77976a06"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> index 2735306..c0f6c94 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> +++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> @@ -4,15 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=7ddcdd3b8e69edc8c5ae7e6bb64f0bc5"
>   
> -SRCNAME = "WebTest"
> +PYPI_PACKAGE = "WebTest"
>   
>   RDEPENDS_${PN} += "python-beautifulsoup4"
>   
> -SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "98e8b59da3cc6c150cebca8c92b66041"
>   SRC_URI[sha256sum] = "3dc92ecd7604e21fc7c97578e4c43aff2a67cebdd4884a2aa804d85e85b34b55"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> index e74efd9..0016e63 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>   
> -SRCNAME = "WSME"
> -
> -SRC_URI = "https://pypi.python.org/packages/8d/c5/0d0ba34f228aa1b5512cbfa833aba24755523ed2eca3ece043702ea19911/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "WSME"
>   
>   SRC_URI[md5sum] = "23b0269af3f4c1db8cfa35054703f0db"
>   SRC_URI[sha256sum] = "afdd3ba14f815837239d6dead652de460bd61a869e39430b459be77d1a928197"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb b/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
> index d892761..65063e5 100644
> --- a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
> @@ -4,15 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ebb582f22ddff5dcb0bc33d04f7cbb8"
>   
> -PR = "r0"
> -SRCNAME = "xattr"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/x/xattr/xattr-0.6.4.tar.gz \
> -		  "
> -
>   SRC_URI[md5sum] = "1bef31afb7038800f8d5cfa2f4562b37"
>   SRC_URI[sha256sum] = "f9dcebc99555634b697fa3dad8ea3047deb389c6f1928d347a0c49277a5c0e9e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> \ No newline at end of file
> +inherit setuptools pypi
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> index ce2268c..ff491a2 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=97d9c60d3a8c5fccccb317f944688479"
>   
> -SRCNAME = "XStatic-Bootstrap-Datepicker"
> -SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
>   
>   SRC_URI[md5sum] = "c2f5c58a7b41162923eca5a36b29b8b2"
>   SRC_URI[sha256sum] = "9edc9b77501001fcee9fbf4bf0a722c263efd928ef928b40081a8269fdd9a944"
>   
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
> index ceb4c9d..296e394 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=898ae9ca7b59edc4521f10be07c6b622"
>   
> -SRCNAME = "XStatic-mdi"
> -SRC_URI = "https://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-mdi"
>   
>   SRC_URI[md5sum] = "f3d3d58603178e5898ee1ea4737826ee"
>   SRC_URI[sha256sum] = "19b4d522f8fa62fee2893b39147fcf45ebaba8b95d63f3708ebdf34e130a8a53"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> 


