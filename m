Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17389E00D51; Wed,  8 Nov 2017 11:19:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5D38E00D4D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Nov 2017 11:19:00 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8JIxZt020261
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 Nov 2017 11:18:59 -0800 (PST)
Received: from server.local (128.224.20.254) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:18:59 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8cd89b01-8886-c839-c74f-fb55fc32a248@windriver.com>
Date: Wed, 8 Nov 2017 14:18:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH 0/n] uprev 'oslo' packages to stable/pike
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
X-List-Received-Date: Wed, 08 Nov 2017 19:19:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-07 3:38 PM, Mark Asselstine wrote:
> 
> Newton is now EOL'd and we never did manage to get all the uprev's
> complete to ensure newton was fully functional. Builds will start
> failing as the 'newton' branch has been renamed 'newton-eol', so if
> you haven't already fetched and try to build you will get nothing but
> screens of errors.
> 
> Pike has been out since Aug. and is the current stable branch so this
> is the start of getting things moved to the pike release. This set of
> changes will be followed by the uprev's to the core openstack
> components (hopefully in a few days).
> 
> The following is the diffstat covering all 10 commits. Note that the
> majority of the changes are to the *oslo*bb files but as usual we had
> to do some initial changes to uprev and add new python packages, per
> the requirements.txt files found in the various packages.


merged .. we can't break what isn't currently working ;)

Bruce

> 
> Mark
> 
> --
> meta-openstack/conf/layer.conf                                             |  4 +---
> meta-openstack/recipes-devtools/python/python-amqp_1.4.9.bb                | 16 ----------------
> meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb                | 16 ----------------
> meta-openstack/recipes-devtools/python/python-amqp_2.2.2.bb                | 14 ++++++++++++++
> meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb           | 15 +++++++++++++++
> meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb              | 23 -----------------------
> meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb               | 20 --------------------
> meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb               | 16 ++++++++++++++++
> meta-openstack/recipes-devtools/python/python-os-client-config_git.bb      |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb            |  4 ++--
> meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb      |  8 +++-----
> meta-openstack/recipes-devtools/python/python-oslo.config_git.bb           |  8 +++++---
> meta-openstack/recipes-devtools/python/python-oslo.context_git.bb          |  7 ++++---
> meta-openstack/recipes-devtools/python/python-oslo.db_git.bb               | 10 +++-------
> meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb             |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.log_git.bb              |  7 ++++---
> meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb        | 12 ++++--------
> meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb       |  7 ++++---
> meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb           |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb          |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb         |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb    |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.service_git.bb          |  7 ++++---
> meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb            |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb           |  6 +++---
> meta-openstack/recipes-devtools/python/python-oslotest_git.bb              |  9 ++++-----
> meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb  | 30 ------------------------------
> meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb  | 28 ++++++++++++++++++++++++++++
> meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb | 32 --------------------------------
> meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb | 22 ++++++++++++++++++++++
> meta-openstack/recipes-devtools/python/python-statsd_3.2.1.bb              | 15 +++++++++++++++
> meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb          | 32 --------------------------------
> meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb          | 20 ++++++++++++++++++++
> meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb            | 18 ++++++++++++++++++
> meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb                | 13 +++++++++++++
> 36 files changed, 226 insertions(+), 241 deletions(-)
> 


