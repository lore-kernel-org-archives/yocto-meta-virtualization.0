Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49C72E00D37; Fri,  5 Feb 2016 10:42:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB268E00BA4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Feb 2016 10:42:31 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u15IgVrd006743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 5 Feb 2016 10:42:31 -0800 (PST)
Received: from server.local (147.11.119.32) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 5 Feb 2016 10:42:30 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56B4ED15.7040806@windriver.com>
Date: Fri, 5 Feb 2016 13:42:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-vitualization][m-c-s][0/49] Uprev to Liberty
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
X-List-Received-Date: Fri, 05 Feb 2016 18:42:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-03 8:40 PM, Mark Asselstine wrote:
> Bruce, meta-virt folks,
>
> The following is the majority of the uprev to OpenStack Liberty. Sorry
> for the delay in getting this out but it took a while to organize the
> commits.  This was working in early December but I have only done
> build tests with this series over the past few days. I will do some
> runtime testing in the coming days but what is here is ready for
> review and hopefully in shape to be merged. Please review and provide
> any feedback. I tried to keep the individual commits small and concise
> to help folks review things but it is still a log of changes whichever
> way you look at it.
>
> This is all master. Once I make sure the runtime is still in working
> order we can create a liberty branch.
>
>

I looked, and nothing jumped out at me. The commits are granular enough
and the documentation of what OpenStack project required the package or
uprev was nice to see.

Since this definitely falls into my "it can't be worse than it was before"
(no slam on the content .. master is just a work in progress), I'll
go ahead and get this merged today.

Bruce

> Mark
>
>
> Pull request follows:
> ---------
>
>
> The following changes since commit 9ed0aef7b244773a9db644090b4e361fa7b3eea8:
>
>    ruby-shadow: Work around cross compile gem problem (2016-01-19 08:50:53 -0500)
>
> are available in the git repository at:
>
>    https://github.com/masselstine/meta-cloud-services.git
>
> for you to fetch changes up to 22342ad611cde4ec3e7d07d130fd20be2aafd0f6:
>
>    nova: uprev to Liberty (2016-02-03 20:06:55 -0500)
>
> ----------------------------------------------------------------
> Mark Asselstine (49):
>        housekeeping: remove references to openvswitch-controller
>        python-oslo*: convert to 'git' and uprev
>        python-cachetools: initial version
>        python-debtcollector: initial version
>        python-ecdsa: initial version
>        python-fasteners: initial version
>        python-os-brick: initial version
>        python-oslo.reports: initial version
>        python-oslo.versionedobjects: initial version
>        python-oslo*: uprev to versions required by liberty
>        python-*: uprev to versions required for liberty
>        python-oslo.service: update dependencies
>        python-trollius: initial version
>        python-suds-jurko: initial version
>        python-repoze.who: initial version
>        python-python-editor: initial version
>        python-ordereddict: initial version
>        python-futurist: initial version
>        python-contextlib2: initial version
>        python-aioeventlet: initial version
>        python-castellan: initial version
>        python-automaton: initial versioin
>        python-kafka: initial version
>        python-jsonpath-rw-ext: initial version
>        python-zaqarclient: initial version
>        python-unicodecsv: initial version
>        python-oslo.cache: initial version
>        python-mistralclient: initial version
>        python-manilaclient: initial version
>        python-magnumclient: initial version
>        python-designateclient: initial version
>        python-ryu: initial version
>        python-django-babel: initial version
>        python-xstatic-bootstrap-datepicker: recipe fixup
>        python-xstatic-angular-gettext: initial version
>        python-xstatic-bootswatch: initial version
>        python-xstatic-mdi: initial version
>        python-xstatic-roboto-fontface: initial version
>        glance: uprev to Liberty
>        ceilometer: uprev to Liberty
>        cinder: uprev to Liberty
>        heat: uprev to Liberty
>        neutron: uprev to Liberty
>        django-openstack-auth: uprev and switch to git
>        horizon: uprev to Liberty
>        python-oauthlib: allow apache to read requires.txt
>        trove: move to latest release
>        keystone: uprev to Liberty
>        nova: uprev to Liberty
>
>   meta-openstack/conf/layer.conf                     |   3 +
>   meta-openstack/licenses/CC-BY-4.0                  | 393 +++++++++++++++++++++
>   .../Makefile-skip-building-docs.patch              |  33 ++
>   .../python/python-aioeventlet_0.4.bb               |  27 ++
>   ...mbic_0.7.5.post2.bb => python-alembic_0.8.3.bb} |   9 +-
>   .../python/python-automaton_0.8.0.bb               |  28 ++
>   .../python/python-cachetools_git.bb                |  16 +
>   .../python/python-castellan_git.bb                 |  34 ++
>   .../python/python-ceilometer_git.bb                |  30 +-
>   .../python/python-ceilometerclient_git.bb          |  18 +-
>   .../recipes-devtools/python/python-cinder_git.bb   |  50 ++-
>   .../python/python-cinderclient_git.bb              |   8 +-
>   ...thon-cliff_1.13.0.bb => python-cliff_1.15.0.bb} |  15 +-
>   .../python/python-contextlib2_0.4.0.bb             |  24 ++
>   .../python/python-debtcollector_0.10.0.bb          |  26 ++
>   .../python/python-designateclient_git.bb           |  31 ++
>   .../python/python-django-babel_git.bb              |  27 ++
>   ....3.0.bb => python-django-openstack-auth_git.bb} |  12 +-
>   .../recipes-devtools/python/python-ecdsa_0.13.bb   |  26 ++
>   .../python/python-fasteners_git.bb                 |  26 ++
>   ...thon-futures_2.2.0.bb => python-futures_git.bb} |  12 +-
>   .../python/python-futurist_0.8.0.bb                |  26 ++
>   .../recipes-devtools/python/python-glance_git.bb   |  31 +-
>   .../python/python-glanceclient_git.bb              |   5 +-
>   .../python/python-glancestore_git.bb               |   4 +-
>   .../recipes-devtools/python/python-heat_git.bb     |  42 ++-
>   .../recipes-devtools/python/python-horizon_git.bb  | 119 ++++---
>   .../python/python-jsonpath-rw-ext_git.bb           |  27 ++
>   .../recipes-devtools/python/python-kafka_git.bb    |  25 ++
>   .../recipes-devtools/python/python-keystone_git.bb |  13 +-
>   .../python/python-keystoneclient_git.bb            |   6 +-
>   .../python/python-keystonemiddleware_git.bb        |   5 +-
>   .../python/python-magnumclient_git.bb              |  34 ++
>   .../python/python-manilaclient_git.bb              |  35 ++
>   ...n-memcached_1.53.bb => python-memcached_git.bb} |  13 +-
>   .../python/python-mistralclient_git.bb             |  27 ++
>   .../recipes-devtools/python/python-neutron_git.bb  |  68 ++--
>   .../python/python-neutronclient_git.bb             |  26 +-
>   .../nova-add-migrate.cfg-to-the-MANIFEST.patch     |  24 --
>   .../recipes-devtools/python/python-nova/nova.conf  |   2 +-
>   .../recipes-devtools/python/python-nova_git.bb     |  17 +-
>   .../python/python-novaclient_git.bb                |   6 +-
>   .../python/python-oauthlib_0.7.2.bb                |   2 +-
>   .../python/python-ordereddict_1.1.bb               |  27 ++
>   .../recipes-devtools/python/python-os-brick_git.bb |  25 ++
>   .../python/python-oslo.cache_git.bb                |  35 ++
>   ...ncy_1.9.0.bb => python-oslo.concurrency_git.bb} |  18 +-
>   .../python/python-oslo.config_1.14.0.bb            |  23 --
>   .../python/python-oslo.config_git.bb               |  27 ++
>   .../python/python-oslo.context_git.bb              |   7 +-
>   ...thon-oslo.db_1.9.0.bb => python-oslo.db_git.bb} |  15 +-
>   ...-oslo.i18n_1.6.0.bb => python-oslo.i18n_git.bb} |  10 +-
>   .../recipes-devtools/python/python-oslo.log_git.bb |  12 +-
>   .../python/python-oslo.messaging_git.bb            |  27 +-
>   .../python/python-oslo.middleware_1.1.0.bb         |  28 --
>   .../python/python-oslo.middleware_git.bb           |  38 ++
>   ...o.policy_0.4.0.bb => python-oslo.policy_git.bb} |  15 +-
>   .../python/python-oslo.reports_git.bb              |  32 ++
>   ...otwrap_1.7.0.bb => python-oslo.rootwrap_git.bb} |  10 +-
>   .../python/python-oslo.serialization_git.bb        |  12 +-
>   .../python/python-oslo.service_git.bb              |  14 +
>   .../python/python-oslo.utils_git.bb                |  15 +-
>   .../python/python-oslo.versionedobjects_git.bb     |  36 ++
>   .../python/python-oslo.vmware_1.19.0.bb            |  25 --
>   .../python/python-oslo.vmware_git.bb               |  37 ++
>   ...on-oslotest_1.6.0.bb => python-oslotest_git.bb} |  14 +-
>   .../{python-pbr_1.4.0.bb => python-pbr_1.8.1.bb}   |   5 +-
>   ...python-pycadf_0.9.0.bb => python-pycadf_git.bb} |   9 +-
>   .../python/python-pysaml2_2.4.0.bb                 |  23 --
>   .../recipes-devtools/python/python-pysaml2_git.bb  |  24 ++
>   .../python/python-python-editor_git.bb             |  22 ++
>   .../python/python-repoze.who_2.2.bb                |  28 ++
>   .../recipes-devtools/python/python-routes_2.1.bb   |  18 -
>   .../recipes-devtools/python/python-routes_git.bb   |  17 +
>   .../recipes-devtools/python/python-ryu_git.bb      |  32 ++
>   ...tevedore_1.6.0.bb => python-stevedore_1.9.0.bb} |   7 +-
>   .../python/python-suds-jurko_0.6.bb                |  24 ++
>   .../recipes-devtools/python/python-taskflow_git.bb |  17 +-
>   ...python-tooz_0.15.0.bb => python-tooz_1.25.0.bb} |  15 +-
>   .../recipes-devtools/python/python-trollius_git.bb |  22 ++
>   .../recipes-devtools/python/python-trove_git.bb    |  15 +-
>   .../python/python-troveclient_git.bb               |   9 +-
>   .../python/python-unicodecsv_git.bb                |  24 ++
>   .../python-xstatic-angular-gettext_2.1.0.2.bb      |  22 ++
>   .../python-xstatic-bootstrap-datepicker_1.3.1.0.bb |  10 +-
>   .../python/python-xstatic-bootswatch_3.3.5.3.bb    |  22 ++
>   .../python/python-xstatic-mdi_1.1.70.1.bb          |  22 ++
>   .../python-xstatic-roboto-fontface_0.4.3.2.bb      |  22 ++
>   .../python/python-zaqarclient_git.bb               |  29 ++
>   .../packagegroups/packagegroup-cloud-controller.bb |   1 -
>   .../recipes-support/deploychef/files/startup-list  |   1 -
>   91 files changed, 1933 insertions(+), 414 deletions(-)
>   create mode 100644 meta-openstack/licenses/CC-BY-4.0
>   create mode 100644 meta-openstack/recipes-devtools/python/python-aioeventlet/Makefile-skip-building-docs.patch
>   create mode 100644 meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
>   rename meta-openstack/recipes-devtools/python/{python-alembic_0.7.5.post2.bb => python-alembic_0.8.3.bb} (63%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-cachetools_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-castellan_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-cliff_1.13.0.bb => python-cliff_1.15.0.bb} (57%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-contextlib2_0.4.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-debtcollector_0.10.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-designateclient_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-django-babel_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-django-openstack-auth_1.3.0.bb => python-django-openstack-auth_git.bb} (62%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-ecdsa_0.13.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-fasteners_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-futures_2.2.0.bb => python-futures_git.bb} (53%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-jsonpath-rw-ext_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-kafka_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-memcached_1.53.bb => python-memcached_git.bb} (68%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-nova/nova-add-migrate.cfg-to-the-MANIFEST.patch
>   create mode 100644 meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-os-brick_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-oslo.concurrency_1.9.0.bb => python-oslo.concurrency_git.bb} (52%)
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-oslo.db_1.9.0.bb => python-oslo.db_git.bb} (67%)
>   rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.6.0.bb => python-oslo.i18n_git.bb} (62%)
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-oslo.policy_0.4.0.bb => python-oslo.policy_git.bb} (59%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-oslo.rootwrap_1.7.0.bb => python-oslo.rootwrap_git.bb} (60%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-oslotest_1.6.0.bb => python-oslotest_git.bb} (72%)
>   rename meta-openstack/recipes-devtools/python/{python-pbr_1.4.0.bb => python-pbr_1.8.1.bb} (80%)
>   rename meta-openstack/recipes-devtools/python/{python-pycadf_0.9.0.bb => python-pycadf_git.bb} (67%)
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-pysaml2_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-python-editor_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-routes_2.1.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-routes_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-ryu_git.bb
>   rename meta-openstack/recipes-devtools/python/{python-stevedore_1.6.0.bb => python-stevedore_1.9.0.bb} (72%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
>   rename meta-openstack/recipes-devtools/python/{python-tooz_0.15.0.bb => python-tooz_1.25.0.bb} (60%)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-trollius_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-unicodecsv_git.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.1.0.2.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.5.3.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.1.70.1.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb
>   create mode 100644 meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
>


