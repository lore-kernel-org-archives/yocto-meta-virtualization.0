Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F5CBE00D07; Tue, 14 Nov 2017 09:41:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	URIBL_SBL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: 999.bb]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A301E00C84
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:41:16 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAEHfFbO001643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:41:16 -0800 (PST)
Received: from server.local (128.224.21.62) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 14 Nov 2017 09:41:15 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510609685-18066-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <6c921df2-dc4d-f873-350a-46830aa9a3ff@windriver.com>
Date: Tue, 14 Nov 2017 12:41:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510609685-18066-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH] python-*: switch remaining pypi recipes to use the pypi class
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
X-List-Received-Date: Tue, 14 Nov 2017 17:41:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-13 4:48 PM, Mark Asselstine wrote:
> Cleanup the various python-* recipes which download from pypi. The
> biggest change is to "inherit pypi" which should result in us always
> using current pypi best practices. This will for example ensure we are
> using https and not http which is apparently going to be disabled
> soon.
> 
> In most cases we are able to drop SRC_URI, however, for some recipes
> using archived versions of packages we must set PYPI_SRC_URI to
> overwrite what the pypi class would derive. For example when the
> archive is a zip and not a tar.gz.
> 
> In all cases we can drop the defining of 'S' and 'PR' as the pypi
> class and the PR server will set these correctly.
> 
> In most cases we can drop SRCNAME. Where needed we instead set
> PYPI_PACKAGE to overwrite the derived name that the pypi class would
> otherwise calculate.
> 

Thanks!

merged.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb |  8 +-------
>   .../recipes-devtools/python/python-cephclient_0.1.0.5.bb       | 10 +++-------
>   meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb    |  8 +-------
>   .../recipes-devtools/python/python-colorama_0.3.3.bb           | 10 +---------
>   .../recipes-devtools/python/python-coverage_4.0a5.bb           |  9 +--------
>   .../recipes-devtools/python/python-croniter_0.3.5.bb           | 10 +++-------
>   .../recipes-devtools/python/python-cssselect_0.9.1.bb          |  9 +--------
>   .../recipes-devtools/python/python-decorator_3.4.0.bb          |  9 +--------
>   .../recipes-devtools/python/python-django-nose_1.4.bb          |  8 +-------
>   .../recipes-devtools/python/python-django-pyscss_2.0.2.bb      |  8 +-------
>   meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb    |  7 +------
>   .../recipes-devtools/python/python-eventlet_0.20.0.bb          |  2 +-
>   .../recipes-devtools/python/python-eventlet_0.21.0.bb          |  8 +-------
>   meta-openstack/recipes-devtools/python/python-falcon_0.2.bb    |  9 +--------
>   .../recipes-devtools/python/python-greenlet_0.4.5.bb           |  9 +++++----
>   .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb      |  9 +--------
>   .../recipes-devtools/python/python-html5lib_0.999.bb           |  9 +--------
>   meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb    |  8 ++------
>   meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb |  9 +--------
>   .../recipes-devtools/python/python-iso8601_0.1.10.bb           |  9 +--------
>   .../recipes-devtools/python/python-jsonpatch_1.11.bb           |  9 +--------
>   .../recipes-devtools/python/python-jsonpath-rw_1.4.0.bb        |  8 +-------
>   .../recipes-devtools/python/python-jsonpointer_1.9.bb          |  9 +--------
>   .../recipes-devtools/python/python-jsonschema_2.5.1.bb         |  9 +--------
>   meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb     | 10 +++-------
>   meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb    |  9 +--------
>   .../recipes-devtools/python/python-memcache_1.2.9.bb           |  8 ++------
>   .../recipes-devtools/python/python-networkx_1.9.1.bb           |  9 +--------
>   .../recipes-devtools/python/python-nose-exclude_0.2.0.bb       | 10 +---------
>   .../recipes-devtools/python/python-oauthlib_0.7.2.bb           |  9 +--------
>   .../recipes-devtools/python/python-openstack-nose_0.11.bb      | 10 ++--------
>   .../recipes-devtools/python/python-openstackclient_1.1.0.bb    |  8 ++------
>   .../recipes-devtools/python/python-ordereddict_1.1.bb          |  8 +-------
>   .../recipes-devtools/python/python-osprofiler_1.5.0.bb         |  7 +------
>   meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb |  8 +-------
>   meta-openstack/recipes-devtools/python/python-pint_0.6.bb      | 10 ++++------
>   .../recipes-devtools/python/python-posix-ipc_1.0.0.bb          | 10 ++++------
>   .../recipes-devtools/python/python-prettytable_0.7.2.bb        |  9 +--------
>   meta-openstack/recipes-devtools/python/python-py_1.4.26.bb     |  9 +--------
>   meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb  |  9 +--------
>   meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb  |  8 ++------
>   .../recipes-devtools/python/python-pysqlite_2.6.3.bb           |  9 +--------
>   meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb  |  8 +-------
>   .../recipes-devtools/python/python-repoze.lru_0.6.bb           |  8 +-------
>   .../recipes-devtools/python/python-repoze.who_2.2.bb           |  8 +-------
>   .../recipes-devtools/python/python-requestsexceptions_1.3.0.bb |  7 +------
>   .../recipes-devtools/python/python-retrying_1.3.3.bb           |  9 +--------
>   meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb |  8 +-------
>   .../recipes-devtools/python/python-rtslib-fb_2.1.51.bb         |  8 +-------
>   .../recipes-devtools/python/python-semantic-version_2.4.2.bb   |  7 ++-----
>   .../recipes-devtools/python/python-sqlparse_0.1.16.bb          |  7 +------
>   .../recipes-devtools/python/python-sysv-ipc_0.6.8.bb           |  9 ++-------
>   meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb   |  8 +-------
>   meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb     |  8 +-------
>   .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb     |  8 +-------
>   .../recipes-devtools/python/python-virtualenv_1.11.4.bb        |  9 +--------
>   .../recipes-devtools/python/python-websockify_0.6.0.bb         |  9 +--------
>   meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb | 10 +++-------
>   .../python/python-xstatic-angular-cookies_1.2.1.1.bb           |  9 ++-------
>   .../python/python-xstatic-angular-fileupload_12.0.4.0.bb       |  7 ++-----
>   .../python/python-xstatic-angular-irdragndrop_1.0.2.2.bb       |  7 ++-----
>   .../python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb       |  7 ++-----
>   .../python/python-xstatic-angular-mock_1.2.1.1.bb              |  9 ++-------
>   .../python/python-xstatic-angular-schema-form_0.8.13.0.bb      |  7 ++-----
>   .../recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb    |  9 ++-------
>   .../python/python-xstatic-jquery-migrate_1.2.1.1.bb            |  9 ++-------
>   .../python/python-xstatic-jquery-ui_1.11.0.1.bb                |  9 ++-------
>   .../python/python-xstatic-jquery.quicksearch_2.0.3.1.bb        |  9 ++-------
>   .../python/python-xstatic-jquery.tablesorter_2.14.5.1.bb       |  9 ++-------
>   .../recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb  |  9 ++-------
>   .../python/python-xstatic-magic-search_0.2.5.1.bb              |  7 ++-----
>   .../python/python-xstatic-objectpath_1.2.1.0.bb                |  7 ++-----
>   .../recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb   |  9 ++-------
>   .../recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb |  9 ++-------
>   .../python/python-xstatic-smart-table_1.4.13.2.bb              |  7 ++-----
>   .../recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb     |  9 ++-------
>   .../recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb      |  7 ++-----
>   meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb |  9 ++-------
>   meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb    |  8 +-------
>   recipes-devtools/python/python-greenlet_0.4.9.bb               |  7 ++-----
>   recipes-devtools/python/python-pyparsing_2.0.1.bb              |  9 +--------
>   81 files changed, 127 insertions(+), 555 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> index 822c878..cffff66 100644
> --- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
>   
> -PR = "r0"
> -SRCNAME = "anyjson"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
>   SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> diff --git a/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
> index ad55514..7ce7307 100644
> --- a/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
> @@ -4,17 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>   
> -PR = "r0"
> -
> -SRCNAME = "python-cephclient"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-v${PV}.tar.gz"
> +PYPI_PACKAGE = "python-cephclient"
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
>   
>   SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
>   SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> index 0794a4e..6e8949d 100644
> --- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> @@ -4,15 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
>   
> -SRCNAME = "cmd2"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
>   SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools  pypi
>   
>   RDEPENDS_${PN} += "python-pyparsing"
> diff --git a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
> index a45335a..81b7e09 100644
> --- a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
> @@ -7,18 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14d0b64047ed8f510b51ce0495995358"
>   
> -PR = "r0"
> -SRCNAME = "colorama"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
> -
>   SRC_URI[md5sum] = "a56b8dc55158a41ab3c89c4c8feb8824"
>   SRC_URI[sha256sum] = "eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
> index 4e8e17f..9e63221 100644
> --- a/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
> @@ -7,17 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
>   
> -SRCNAME = "coverage"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
> -
>   SRC_URI[md5sum] = "37f4d8ae679b2c43a87da8d519817a3b"
>   SRC_URI[sha256sum] = "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a5b04dc8597a07e0e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
> index 723ca68..128a4aa 100644
> --- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
> @@ -4,17 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2c82e6382ef84397e2341a04f039abcc"
>   
> -PR = "r0"
> -
> -SRCNAME = "croniter"
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +# Archived version so we have to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.zip"
>   
>   SRC_URI[md5sum] = "63cf9e4d6778dc4102a4794a39a1b45b"
>   SRC_URI[sha256sum] = "ecd5cda855668ae11ed5ea341e9c2145bbab88bfd0763666951cfe15bab23f50"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
> index 16a0167..0c4426c 100644
> --- a/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cssselect_0.9.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=952026b3fd2f625f2a3c0aa21da2493d"
>   
> -PR = "r0"
> -
> -SRCNAME = "cssselect"
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c74f45966277dc7a0f768b9b0f3522ac"
>   SRC_URI[sha256sum] = "0535a7e27014874b27ae3a4d33e8749e345bdfa62766195208b7996bf1100682"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb b/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> index 8b88543..73111f6 100644
> --- a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://setup.py;beginline=8;endline=8;md5=08a46ecda64aec8026447390e764b86e"
>   
> -PR = "r0"
> -SRCNAME = "decorator"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "1e8756f719d746e2fc0dd28b41251356"
>   SRC_URI[sha256sum] = "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51f36e1a7988d9d783"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools  pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb b/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
> index a316c04..10d2267 100644
> --- a/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
> @@ -7,16 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7f88f52f66738ec7259424ce46e855c2"
>   
> -SRCNAME = "django-nose"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
>   SRC_URI[md5sum] = "2713d95286ea49860458a312d2efe653"
>   SRC_URI[sha256sum] = "26cef3c6f62df2eee955a25195de6f793881317c0f5fd1a1c6f9e22f351a9313"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
> index 7c5606a..45f947e 100644
> --- a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=07339dad721a3ae7e420b8b751a15c70"
>   
> -
> -SRCNAME = "django-pyscss"
> -SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "f8dbcc4d314c8e220aa311ec6561b06d"
>   SRC_URI[sha256sum] = "0f4844f8fd3f69f4d428a616fdcf2b650a24862dd81443ae3fba14980c7b0615"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> index 4671a59..990f96b 100644
> --- a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> @@ -7,15 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=4325afd396febcb659c36b49533135d4 \
>                       file://LICENSE.PSF;md5=1ad8a43fc3bbfea1585223c99f4c3e6f \
>   "
>   
> -SRCNAME = "enum"
> -SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "ce75c7c3c86741175a84456cc5bd531e"
>   SRC_URI[sha256sum] = "9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> index 9d3c0da..f52d5af 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
>   SRC_URI[md5sum] = "057276232bf65f1db6aabf819e7ece6a"
>   SRC_URI[sha256sum] = "2e17cda85f2003796f13de0e6c59a5253c0afd1f45dfc97bb9b6bfb8962f7895"
>   
> -inherit setuptools pypi
> +inherit setuptools pypi pypi
>   
>   RDEPENDS_${PN} += " \
>       python-enum34 \
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> index 768759c..47f69ad 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
>   
> -SRCNAME = "eventlet"
> -
> -SRC_URI = "https://pypi.python.org/packages/cb/ec/eae487c106a7e38f86ac4cadafb3eec77d29996f64ca0c7015067538069b/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "92aaac4c0abaddff9329f55d8f5bcd76"
>   SRC_URI[sha256sum] = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb b/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
> index 4045b1b..6347210 100644
> --- a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=2bf705a48be7b7799862ffe602c94b87"
>   
> -PR = "r0"
> -
> -SRCNAME = "falcon"
> -SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "bf9e8bdd20700f1ff7ce6397cd441fbd"
>   SRC_URI[sha256sum] = "92bb899bf6e58e2299e3b1de1e628b90c38544ba3354a0141d108318b50c3402"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # conflicting file prevention
>   do_install_append() {
> diff --git a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> index fa6f047..2f5824f 100644
> --- a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> @@ -4,11 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT & PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                       file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> -SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
> +
> +# Archived version so we have to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
> +
>   SRC_URI[md5sum] = "ce383f6475e6311cf8932ea779938703"
>   SRC_URI[sha256sum] = "b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c034d1d8cbf08e2dbe"
>   
> -S = "${WORKDIR}/greenlet-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb b/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
> index 1915fc1..ca6a48d 100644
> --- a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   
> -PR = "r0"
> -SRCNAME = "heat-cfntools"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "0d5f8e7685e7f9a34dbd2552ffa40984"
>   SRC_URI[sha256sum] = "de7d93338d3afb71cc4c53d713740316ead0af3a9c869b1231617347e94a8326"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += "\
>       python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb b/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> index 9ad84e8..dd8b1d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> +++ b/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
>   
> -PR = "r0"
> -
> -SRCNAME = "html5lib"
> -SRC_URI = "http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "acb8ba4d6db5637360a07859192eb7f8"
>   SRC_URI[sha256sum] = "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb b/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
> index ddc612a..f14e7a8 100644
> --- a/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-i18n_0.3.1.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://README.md;md5=7624ac071dec291ca8ef74e62e536a7a"
>   
> -
> -SRCNAME = "python-i18n"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "python-i18n"
>   
>   SRC_URI[md5sum] = "08b8c247add9f90806c4742a685fdb88"
>   SRC_URI[sha256sum] = "e1d832ff7d1d39ce593793cc709b2344aa8fdf321cf707081335f146160d9f20"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb b/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
> index d0d39f6..501e895 100644
> --- a/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d8b8c1199001505d7b77da5db34ba441"
>   
> -PR = "r0"
> -
> -SRCNAME = "ipaddr"
> -SRC_URI = "http://pypi.python.org/packages/source/i/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "f2c7852f95862715f92e7d089dc3f2cf"
>   SRC_URI[sha256sum] = "1b555b8a8800134fdafe32b7d0cb52f5bdbfdd093707c3dd484c5ea59f1d98b7"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> index 047f3c2..1db7543 100644
> --- a/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> +++ b/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
>   
> -PR = "r0"
> -SRCNAME = "iso8601"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/i/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
>   SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> index 3d9f058..8971c96 100644
> --- a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> @@ -4,16 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "BSD+"
>   LIC_FILES_CHKSUM = "file://jsonpatch.py;beginline=3;endline=30;md5=5cd7d1fbd6b236ed142e4285624f58fe"
>   
> -PR = "r0"
> -SRCNAME = "jsonpatch"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "9f2d0aa31f99cc97089a203c5bed3924"
>   SRC_URI[sha256sum] = "22d0bc0f5522a4a03dd9fb4c4cdf7c1f03256546c88be4c61e5ceabd22280e47"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "python-jsonpointer"
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
> index 61c96d0..52fbcc8 100644
> --- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
> @@ -4,13 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD+"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
>   
> -SRCNAME = "jsonpath-rw"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
>   SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> index 61b2f3f..12b5e89 100644
> --- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://jsonpointer.py;beginline=3;endline=31;md5=5e663c88967b53590856107a043d605c"
>   
> -PR = "r0"
> -SRCNAME = "jsonpointer"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c4d3f28e72ba77062538d1c0864c40a9"
>   SRC_URI[sha256sum] = "39403b47a71aa782de6d80db3b78f8a5f68ad8dfc9e674ca3bb5b32c15ec7308"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> index fef8d5f..1174795 100644
> --- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
>   
> -PR = "r0"
> -SRCNAME = "jsonschema"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.zip"
> -
>   SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"
>   SRC_URI[sha256sum] = "9088494da4c74497a7a27842ae4ca9c3355b5f7754121edc440463eaf020f079"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += "python-vcversioner"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb b/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
> index 7c25e03..78a006b 100644
> --- a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
> @@ -4,17 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   
> -PR = "r0"
> -
> -SRCNAME = "kazoo"
> -SRC_URI = "http://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +# Archived version so we have to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.zip"
>   
>   SRC_URI[md5sum] = "4b172de456c102b0e33f661e7e2b3583"
>   SRC_URI[sha256sum] = "f0c42cc7752a331ba59269827bd19cb271210399a9dcab32b6a91465b4431a18"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb b/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> index 73869d7..0e7dde4 100644
> --- a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
>   
> -PR = "r0"
> -
> -SRCNAME = "lxml"
> -SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "88c75f4c73fc8f59c9ebb17495044f2f"
>   SRC_URI[sha256sum] = "6ad6949dc7eea744a30fba77a968dd5910f545220e58bcc813b9df5c793e318a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> index 9679859..96ca87e 100644
> --- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> +++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e8538d10fb74087ea2dc61033b6ebf9f"
>   
> -
> -SRCNAME = "pymemcache"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "pymemcache"
>   
>   SRC_URI[md5sum] = "215510250997423a2a57da061b1bd592"
>   SRC_URI[sha256sum] = "05fd71f0337384024cc3d1340d35fd0d46307cf711eac9365b0eb166812bb121"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb b/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb
> index e3e0851..e1828b7 100644
> --- a/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-networkx_1.9.1.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6bd2e3b81103dff983b4b2d7d3217cf5"
>   
> -PR = "r0"
> -
> -SRCNAME = "networkx"
> -SRC_URI = "http://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "a2d9ee8427c5636426f319968e0af9f2"
>   SRC_URI[sha256sum] = "6380eb38d0b5770d7e50813c8a48ff7c373b2187b4220339c1adce803df01c59"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb b/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb
> index 33f277b..95fee0f 100644
> --- a/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-nose-exclude_0.2.0.bb
> @@ -7,18 +7,10 @@ SECTION = "devel/python"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
>   
> -PR = "r0"
> -SRCNAME = "nose-exclude"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
> -
>   SRC_URI[md5sum] = "c8d798c3e29ac82dd5c7bf98a99404af"
>   SRC_URI[sha256sum] = "27babdc53e0741ed09d21b7fdb5d244aabb1679f67ef81289f0f34e50aca51c9"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
> index c8a9147..fe4560b 100644
> --- a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
>   
> -PR = "r1"
> -
> -SRCNAME = "oauthlib"
> -SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "eb60abdb002b9c08d248707b79a1cc92"
>   SRC_URI[sha256sum] = "a051f04ee8ec3305055ab34d87b36c9a449375e07c7d6a05bcafa48329cac7c3"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb b/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb
> index eaa4c0c..f33e515 100644
> --- a/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb
> +++ b/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb
> @@ -7,18 +7,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>   
> -PR = "r0"
> -SRCNAME = "openstack.nose_plugin"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -          "
> +PYPI_PACKAGE = "openstack.nose_plugin"
>   
>   SRC_URI[md5sum] = "0c6547f413db8c66921b110f78132aac"
>   SRC_URI[sha256sum] = "a28d44dc23de8164d7893da7020404c73c4325b46d5507911f0257c15f613b4f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
> index 37703cc..b4beaad 100644
> --- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRCNAME = "python-openstackclient"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "python-openstackclient"
>   
>   SRC_URI[md5sum] = "c965b343b0fdf97d01e28d5460c7c175"
>   SRC_URI[sha256sum] = "875b54ac95e29cc83ae76513b48306c8493c12d5ba7d23aea3432216f2fa91ba"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += "\
>       python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> index db8afa3..6102ecb 100644
> --- a/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7f0267460024072a9bbf135ee87a41b8"
>   
> -
> -SRCNAME = "ordereddict"
> -SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "a0ed854ee442051b249bfad0f638bbec"
>   SRC_URI[sha256sum] = "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
> index bae0efd..16b9b36 100644
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
> @@ -4,15 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>   
> -SRCNAME = "osprofiler"
> -SRC_URI = "http://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "6762b5420fd95646a26c4eaca1af9e64"
>   SRC_URI[sha256sum] = "aee63cfd888e6049ea82535ce458ce4844b4ac893dcb18060eda24192505627e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> index ae26da1..21c02a2 100644
> --- a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> @@ -10,16 +10,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
>   
> -
> -SRCNAME = "pathlib"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
>   SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb b/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> index 9e6c689..0e987b5 100644
> --- a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> @@ -4,17 +4,15 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
>   
> -PR = "r0"
> -SRCNAME = "Pint"
> +PYPI_PACKAGE = "Pint"
>   
> -SRC_URI = "http://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +# Archived version so we have to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/P/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.zip"
>   
>   SRC_URI[md5sum] = "88aa0918019071546b10c5fbdc91ae5e"
>   SRC_URI[sha256sum] = "b1ab3b589ca4d78689233a007abd5a7eec4ea65302cabaed06932d20f2a9e748"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "gmp"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb
> index 5da3f92..0b344c1 100644
> --- a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb
> @@ -4,17 +4,15 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d92bb5439aee694c0a87bfb51579e37b"
>   
> -PR = "r0"
> +PYPI_PACKAGE = "posix_ipc"
>   
> -SRCNAME = "posix_ipc"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +# Archived version so we need to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
>   
>   SRC_URI[md5sum] = "85607a392087715ac3a3c7ded2492d06"
>   SRC_URI[sha256sum] = "9c93070374ca672725575e5c9874930c8cde69367fb90378b2255e048e31efcb"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> index 5242bfc..8e09f02 100644
> --- a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
>   
> -PR = "r0"
> -SRCNAME = "prettytable"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/prettytable-0.7.2.zip"
> -
>   SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
>   SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   do_install_append() {
>   	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> diff --git a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb b/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> index 53a5045..1ecc092 100644
> --- a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> +++ b/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>   
> -PR = "r0"
> -
> -SRCNAME = "py"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
>   SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb b/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> index c4b0569..972290d 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
>   
> -PR = "r0"
> -SRCNAME = "pyasn1"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/p/pyasn1/pyasn1-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "2cbd80fcd4c7b1c82180d3d76fee18c8"
>   SRC_URI[sha256sum] = "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
> index 72ea639..bbdc6f3 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
> @@ -4,16 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=28155276e8df3f75bbd327335f66f2fa"
>   
> -
> -SRCNAME = "pyScss"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "pyScss"
>   
>   SRC_URI[md5sum] = "9527b4864cd6023f77a8277e6fb773d7"
>   SRC_URI[sha256sum] = "d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb b/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> index a47666d..41ca76c 100644
> --- a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Zlib"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a85bd923e5c830f8eb89db354ff72f38"
>   
> -PR = "r0"
> -
> -SRCNAME = "pysqlite"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "7ff1cedee74646b50117acff87aa1cfa"
>   SRC_URI[sha256sum] = "fe9c35216bf56c858b34c4b4c8be7e34566ddef29670e5a5b43f9cb8ecfbb28d"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   FILES_${PN} += "${datadir}/*"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> index 56ee8d0..55c784b 100644
> --- a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>   
> -
> -SRCNAME = "pytest"
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "14cde91b1106c937c48497728ea37dc6"
>   SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d045519d6"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> index bdf2f25..3a169b0 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> @@ -8,13 +8,7 @@ SECTION = "devel/python"
>   LICENSE = "BSD-Modification-copyright"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
>   
> -SRCNAME = "repoze.lru"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "2c3b64b17a8e18b405f55d46173e14dd"
>   SRC_URI[sha256sum] = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> index 0bd1d42..3ee8f25 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD-Modification"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
>   
> -
> -SRCNAME = "repoze.who"
> -SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "c677ac4d4a32b6f6880a8f9cf20adffb"
>   SRC_URI[sha256sum] = "322629ec7c779dce4700e8f3ba531002b724d2429178c1cbb0dc169255dc9a8b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
> index 33a5fc6..17ffa8a 100644
> --- a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
> @@ -4,15 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
>   
> -SRCNAME = "requestsexceptions"
> -SRC_URI = "http://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "85c9a2c5c5ecbd2deb0a491613fbdd12"
>   SRC_URI[sha256sum] = "8f141ba636d6748cd29208c1955bde38bf00fcdda1a685bc09d8ed133700353e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # conflicting file prevention
>   do_install_append() {
> diff --git a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> index 053b909..55c94d9 100644
> --- a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
>   
> -PR = "r0"
> -
> -SRCNAME = "retrying"
> -SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "2a126aeef8b21324ecdeac15ff46ef17"
>   SRC_URI[sha256sum] = "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24b37367b0bb41973b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
> index 99da266..0eaf181 100644
> --- a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
>   
> -
> -SRCNAME = "rfc3986"
> -SRC_URI = "http://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "b2b48cd36dabb82d5eaa54bbfb20d382"
>   SRC_URI[sha256sum] = "5ac85eb132fae7bbd811fa48d11984ae3104be30d44d397a351d004c633a68d2"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> index 45eea40..46d6cc4 100644
> --- a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=867c358d5dbac2602d0c0f850f731e62"
>   
> -
> -SRCNAME = "rtslib-fb"
> -SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "4ec7575eb90b7c5a91bbea2962f0e036"
>   SRC_URI[sha256sum] = "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571cbbb809229fd5553e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
> index 746d646..a038abb 100644
> --- a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
> @@ -4,18 +4,15 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a7dcaa0740d59f8f13ef05a3d0ed7313"
>   
> -SRCNAME = "semantic_version"
> -SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "semantic_version"
>   
>   SRC_URI[md5sum] = "fd7d5ade76e78d8540b9a4044496a57c"
>   SRC_URI[sha256sum] = "7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516425f475d5d6932d2"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>   #export BUILD_SYS
>   #export HOST_SYS
>   
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
> index 8ea99d7..93f7210 100644
> --- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
> @@ -4,18 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
>   
> -SRCNAME = "sqlparse"
> -SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
>   SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
>   export BUILD_SYS
>   export HOST_SYS
>   
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> index 03d1efe..c46cfcb 100644
> --- a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9d6e34e7b47096d7c19c1e3be707374e"
>   
> -PR = "r0"
> -
> -SRCNAME = "sysv_ipc"
> -SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "sysv_ipc"
>   
>   SRC_URI[md5sum] = "c6cf5b4aa7cd3e07fd4b5661530eca8c"
>   SRC_URI[sha256sum] = "0af73375a85c5d9d487c2f14f208812600bd81e4046437ebaf55746b3aade00e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
> index a2c4f52..a46cf41 100644
> --- a/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   
> -
> -SRCNAME = "tooz"
> -SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "939eaf6c5e49d3a41e8c9f2e92126cfc"
>   SRC_URI[sha256sum] = "d61639640b8e4fc64195306f8fae92cf271a002c690bf693ee51f9790cf8141e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb b/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
> index 81dbd81..2ba4b0e 100644
> --- a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2d0fc2c2c954dc4d41043e67d4a8d8e7"
>   
> -
> -SRCNAME = "tox"
> -SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "f4db4d6a82d6a651e457ba55ef370258"
>   SRC_URI[sha256sum] = "3125a15da7381f59f835a25bd259a84acb7a69858c81e386c50027bd842bb91b"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> index bcff6f3..7811b69 100644
> --- a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://vcversioner.py;beginline=1;endline=13;md5=b20bc154910c13368ad5ba54560f0b0c"
>   
> -SRCNAME = "vcversioner"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/v/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
>   SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   
>   DEPENDS_class-native += " \
> diff --git a/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb b/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb
> index c2fb657..ebe2cec 100644
> --- a/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-virtualenv_1.11.4.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53df9f8889d6a5fba83f425abe3b1568"
>   
> -PR = "r0"
> -
> -SRCNAME = "virtualenv"
> -SRC_URI = "http://pypi.python.org/packages/source/v/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "9accc2d3f0ec1da479ce2c3d1fdff06e"
>   SRC_URI[sha256sum] = "cf3d958f28eb7470bd04262ef397580a2e57407f2ee2c88e9b2892218eb0465a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
> index aa5554b..386a227 100644
> --- a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
> @@ -4,17 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3b5f97c9d64189899b91b3728bfd774"
>   
> -PR = "r0"
> -SRCNAME = "websockify"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "673a70d007c1a2445c8ef5c7a3067c07"
>   SRC_URI[sha256sum] = "da4364f54fdcc5350059febe2e8fdf2b53d16cf04ee23c71315e561119f44529"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += "gmp"
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb b/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
> index e25dd1d..dc02a44 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsgiref_0.1.2.bb
> @@ -4,17 +4,13 @@ SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fe761dfec1d54629c6b9a3bbc7b1baf5"
>   
> -PR = "r0"
> -
> -SRCNAME = "wsgiref"
> -SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.zip"
> +# Archived version so we need to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/w/wsgiref/wsgiref-${PV}.zip"
>   
>   SRC_URI[md5sum] = "29b146e6ebd0f9fb119fe321f7bcf6cb"
>   SRC_URI[sha256sum] = "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> index 0947add..8c9b55f 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-Angular-Cookies"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-Cookies"
>   
>   SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
>   SRC_URI[sha256sum] = "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb
> index e4f8212..6dcf410 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e634b82c14383ecefd736caa40ed2222"
>   
> -SRCNAME = "XStatic-Angular-FileUpload"
> -SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-FileUpload"
>   
>   SRC_URI[md5sum] = "1cf48c0204783da2f71efe79039a8468"
>   SRC_URI[sha256sum] = "68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
> index 2ad3e55..daa74bc 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
>   
> -SRCNAME = "XStatic-Angular-IrDragNDrop"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-IrDragNDrop"
>   
>   SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
>   SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
> index 1bc71a3..6deebd0 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=92d5d5d8e51c0c2f4f6db4a084a59173"
>   
> -SRCNAME = "XStatic-Angular-lrdragndrop"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-lrdragndrop"
>   
>   SRC_URI[md5sum] = "afd682cab9f436cf22b025dfcabaa225"
>   SRC_URI[sha256sum] = "1cf04495981db5dfd5536441e17ec69bb18d624f847ddc203f3259d81b10a77e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb
> index c40a6d9..0987fbb 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=31b7650558910a1ee9742e742d4ec810"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-Angular-Mock"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-Mock"
>   
>   SRC_URI[md5sum] = "94f072c39c2070f3939b619d913fb37f"
>   SRC_URI[sha256sum] = "ffee6edfab8276abd8057ddc28c4d8503424c0c61938e787720766862ef43e42"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> index f0c2efb..5c71b52 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
>   
> -SRCNAME = "XStatic-Angular-Schema-Form"
> -SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
>   
>   SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
>   SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
> index aca32a5..aef5706 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=18dc983faa3113478ed59ae157a985d5"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-Hogan"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Hogan"
>   
>   SRC_URI[md5sum] = "1c1de09c4813e8568aab98fa5270d6a0"
>   SRC_URI[sha256sum] = "5941bc7fb2a09916b8837848e6fc2a13b2dfc271811e9b522c61e1337d5fc2bd"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> index 02c023f..432b11e 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2bbd78dd61f7b4f2fb6b3e31e4d7a26b"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-JQuery-Migrate"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-JQuery-Migrate"
>   
>   SRC_URI[md5sum] = "2dd39f9d6351aeaf129b33d4134ac6a7"
>   SRC_URI[sha256sum] = "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993d7264731a750900e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
> index 97a1eff..e6aa481 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=55ac15f231e5629fb6576e349c318199"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-jquery-ui"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-jquery-ui"
>   
>   SRC_URI[md5sum] = "03d8ea7a0dab29d548e7bc195703b04f"
>   SRC_URI[sha256sum] = "099b1836eb0d91b8dc98f5b8a6b856a2631d43af0d47f33ef90ee72ed37bda58"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb
> index 19ff86f..ae3f5e0 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=503c3857973c52f673691b910068e2d0"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-JQuery.quicksearch"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-JQuery.quicksearch"
>   
>   SRC_URI[md5sum] = "0dc4bd1882cf35dc7b19a236ba09b89d"
>   SRC_URI[sha256sum] = "1271571b420417add56c274fd935e81bfc79e0d54a03559d6ba5ef369f358477"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
> index eddbe6d..0c4c524 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a9ef3319547ce4563718db4b4657fb94"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-JQuery.TableSorter"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-JQuery.TableSorter"
>   
>   SRC_URI[md5sum] = "fc05a6731b6ac3f6489b893f96a5d29a"
>   SRC_URI[sha256sum] = "3ba24aecd9a3dc71a79dd4096fa5a8a041c3a7b892c61d05e6e46de0605070f0"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
> index 26feb99..3141cf6 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://README.txt;md5=af1f21066b501c7d9265fab0d5556ece"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-jQuery"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-jQuery"
>   
>   SRC_URI[md5sum] = "7a29efeab6961ef00ea2272c923f4503"
>   SRC_URI[sha256sum] = "83416a6bb86e8534858c4d1ddca45e881c87639da6f78000c28c3a193fe91305"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
> index 23fb832..4ff8294 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e3d8469611ec04e52d71f2e293d54e9c"
>   
> -SRCNAME = "XStatic-Magic-Search"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Magic-Search"
>   
>   SRC_URI[md5sum] = "cfb8a82129fffbe1f5c6339240cb6139"
>   SRC_URI[sha256sum] = "9b2f35a5792f4e763e6dc319036e3676f3e18f46153096f3ab5e507177ec007e"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           "
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
> index 71e5fa4..3d256fd 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=98f106ed7f6916011689fc3699a6dabd"
>   
> -SRCNAME = "XStatic-objectpath"
> -SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-objectpath"
>   
>   SRC_URI[md5sum] = "680a5e23a3d362db0b0721e5620dd6fc"
>   SRC_URI[sha256sum] = "cd1e9f502482afcdd028821148843b07b4065c8dcea8e5cc33abb9ae1cf20b20"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb
> index bb01800..f54d6b1 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0093d355f8ef8497e548012c01051ce2"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-QUnit"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-QUnit"
>   
>   SRC_URI[md5sum] = "21d48252d3301bd7ae530bfeffa3d108"
>   SRC_URI[sha256sum] = "c5e2d68d55a3f62b1cfc586112099a522a0a2e2eb22533bbe5dff7d907249ee6"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb
> index c26eb6b..511e7ac 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-rickshaw_1.5.0.0.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af85a1450add1a38e6ff5ca1384cc1b6"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-Rickshaw"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Rickshaw"
>   
>   SRC_URI[md5sum] = "789fffdced10e93e10f75ce1ade6fc6c"
>   SRC_URI[sha256sum] = "147574228757254442700a9eea5150f14acb1224ef0612f896b663ab58406de8"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
> index 987cb8a..f6cf1c2 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e057224b3cd6c78a00683d4f37a924fd"
>   
> -SRCNAME = "XStatic-smart-table"
> -SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-smart-table"
>   
>   SRC_URI[md5sum] = "21640f39d064ea292de9e8e7b33f9595"
>   SRC_URI[sha256sum] = "f2fa5ed37c2953253de79c61c346fa6c3c4f38731295d2240552c14298db6b0a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   DEPENDS += " \
>           python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
> index 8e9145d..86c9ef6 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-spin_1.2.5.2.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=322c2399a1682aaec2f4e5fff4be5726"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic-Spin"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-Spin"
>   
>   SRC_URI[md5sum] = "df83f80fd0b11545b64497112996e49e"
>   SRC_URI[sha256sum] = "7f46ef0e45e047019ba6eda22c432fb96f681b97bbe7f1749aa9209e07727192"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
> index 1301ed9..6678c1b 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
> @@ -4,15 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "PD & MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=68f6d0037519374aba3cc3d13bb66260"
>   
> -SRCNAME = "XStatic-tv4"
> -SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic-tv4"
>   
>   SRC_URI[md5sum] = "921148dff35fb41431d5f122da570248"
>   SRC_URI[sha256sum] = "9b4c57244e914126cdda5d8bc24698189d73800203c85b1fc945a08e25c7c713"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb
> index 4b8c09b..3e5c8d3 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic_1.0.1.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://README.txt;md5=36a1e7eaa71e1bd07b8d2247839f228e"
>   
> -PR = "r0"
> -
> -SRCNAME = "XStatic"
> -SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "XStatic"
>   
>   SRC_URI[md5sum] = "7064b5ea7fd1ee990e0ae0538301d9bc"
>   SRC_URI[sha256sum] = "0ec93d7c66ebb9e0d31b664753437dc8634cb66e13310cb47c9eb1e0bc66d726"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
> index ce027e0..fc9499f 100644
> --- a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
> @@ -4,16 +4,10 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;md5=33573af7505a94ff3d122a7920b2c735"
>   
> -
> -SRCNAME = "zake"
> -SRC_URI = "http://pypi.python.org/packages/source/z/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
>   SRC_URI[md5sum] = "bd8db293a78c22171ecfdd54f4d65c63"
>   SRC_URI[sha256sum] = "2e5bcb215e366e682fd05dd1df4f2e6affceefa5d3781c2987a21fd597659a21"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   # DEPENDS_default: python-pip
>   
> diff --git a/recipes-devtools/python/python-greenlet_0.4.9.bb b/recipes-devtools/python/python-greenlet_0.4.9.bb
> index fa35fa8..49c2551 100644
> --- a/recipes-devtools/python/python-greenlet_0.4.9.bb
> +++ b/recipes-devtools/python/python-greenlet_0.4.9.bb
> @@ -4,11 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                       file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> -SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.tar.gz"
> +
>   SRC_URI[md5sum] = "00bb1822d8511cc85f052e89d1fd919b"
>   SRC_URI[sha256sum] = "79f9b8bbbb1c599c66aed5e643e8b53bae697cae46e0acfc4ee461df48a90012"
>   
> -S = "${WORKDIR}/greenlet-${PV}"
> -
> -inherit distutils
> -
> +inherit distutils pypi
> diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
> index 32d9ebb..2ef6df9 100644
> --- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
> +++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
> @@ -4,14 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
>   
> -PR = "r0"
> -SRCNAME = "pyparsing"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
> -
>   SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
>   SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
>   
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> +inherit distutils pypi
> 


