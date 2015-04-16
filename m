Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F2B2E00965; Thu, 16 Apr 2015 12:14:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86127E0049A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 12:14:35 -0700 (PDT)
Received: by obbeb7 with SMTP id eb7so50733763obb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XvRVUOxpwy4AEnQtXaFctP0Mf8w7SV+wNxYSOov7VbQ=;
	b=x3TbwRA18lb9cOSkIaYw9OjJaUfM0hkXFBQwB411uwC8nY8VcFGKtR1D81Ye0rnLEP
	G1HGdln+NN+xP4vzy+V/ymC66vqK5t0ejbqKaIsQV83lnZJmDeUosL/YM5MdfpxCPSQ/
	qTyaHSqbsd5pcq2dTsljzf/8XPTWiUj1jUgSt0x55vFw/MESdm4HZvANJZ5eu8IX0N5Z
	dyCMxvPSvQ0kHIKDvTMR/UpbsgqZNmo0/Biw2VLycQ+ewCy4x+yW8tRmtC+Sa/H4NQIk
	t9kK+04vfBV8QDuHVvLLDUkKYDSnFFJiu4haYu/Ub5jGcyqyxUEBpQtqoQCRjCyv+YfK
	4aXQ==
MIME-Version: 1.0
X-Received: by 10.202.75.6 with SMTP id y6mr21544340oia.23.1429211674562; Thu,
	16 Apr 2015 12:14:34 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Thu, 16 Apr 2015 12:14:34 -0700 (PDT)
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
Date: Thu, 16 Apr 2015 15:14:34 -0400
Message-ID: <CADkTA4NBHxHuscW=JTP4Yf06cs83mnPKwCFu0mMYu2-2GpT6VA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jackie.huang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 00/14] clients: version upgrades and add a helper meta data
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
X-List-Received-Date: Thu, 16 Apr 2015 19:14:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 1:58 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Thanks Jackie.

I've merged the series.

Bruce

>
> Tested with:
> 1) git clone git://git.yoctoproject.org/auto-upgrade-helper
>
> 2) Add maintainers.inc
> $ cat conf/maintainers.inc
> RECIPE_MAINTAINER = "Jackie Huang <jackie.huang@windriver.com>"
>
> 3) Add upgrade-helper.conf
> $ cat upgrade-helper.conf
> [maintainer_override]
>
> [settings]
> smtp=smtp-na.wrs.com
> from=upgrade.helper@wrs.com
> status_recipients=jackie.huang@windriver.com
> clean_sstate=yes
> clean_tmp=yes
> drop_previous_commits=yes
> machines=qemux86 qemux86-64 qemuarm qemumips qemuppc
>
> 4) Add the following into local.conf:
> INHERIT =+ "distrodata"
> require conf/distro/include/recipe_color.inc
> require conf/distro/include/distro_alias.inc
> require conf/maintainers.inc
> require conf/distro/include/upstream_tracking.inc
> require conf/distro/include/package_regex_openstack.inc
>
> 5) run the script upgradehelper.py:
> $ for i in `cat all_client.txt`; do echo "== $i =="; \
>   /path/to/upgradehelper.py -a -c upgrade-helper.conf $i; \
> done
> --
> The following changes since commit 274cf835e275e8ec2f1a4260bd4437b5cdcaed92:
>
>   python-oslotest: correct the SRC_URI and add bash to rdepends (2015-04-08 10:36:55 -0400)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib jhuang0/r_update_op_clients_150415_2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_update_op_clients_150415_2
>
> Jackie Huang (14):
>   Add helper meta data to find upstream versions correctly
>   rest-client: upgrade to 1.7.3
>   python-barbicanclient: upgrade to 3.0.3
>   python-ceilometerclient: fix the version to 1.0.13
>   python-cephclient: upgrade to 0.1.0.5
>   python-glanceclient: upgrade to 0.17.0
>   python-heatclient: upgrade to 0.4.0
>   python-keystoneclient: upgrade to 1.3.0
>   python-novaclient: upgrade to 2.23.0
>   python-neutronclient: upgrade to 2.4.0
>   python-openstackclient: upgrade to 1.0.3
>   python-saharaclient: upgrade to 0.8.0
>   python-swiftclient: upgrade to 2.4.0
>   python-troveclient: upgrade to 1.0.9
>
>  .../distro/include/package_regex_openstack.inc     | 42 ++++++++++++++++++++++
>  .../python/python-barbicanclient_git.bb            |  4 +--
>  .../python/python-ceilometerclient_git.bb          |  4 +--
>  ...ent_0.1.0.4.bb => python-cephclient_0.1.0.5.bb} |  6 ++--
>  .../python/python-glanceclient_git.bb              |  4 +--
>  .../python/python-heatclient_git.bb                |  4 +--
>  .../python/python-keystoneclient_git.bb            |  4 +--
>  .../python/python-neutronclient_git.bb             |  4 +--
>  .../python/python-novaclient_git.bb                |  4 +--
>  ...nt_1.0.2.bb => python-openstackclient_1.0.3.bb} |  5 ++-
>  .../python/python-saharaclient_git.bb              |  4 +--
>  .../python/python-swiftclient_git.bb               |  4 +--
>  .../python/python-troveclient_git.bb               |  4 +--
>  .../recipes-devtools/ruby/rest-client_git.bb       |  6 ++--
>  14 files changed, 70 insertions(+), 29 deletions(-)
>  create mode 100644 meta-openstack/conf/distro/include/package_regex_openstack.inc
>  rename meta-openstack/recipes-devtools/python/{python-cephclient_0.1.0.4.bb => python-cephclient_0.1.0.5.bb} (78%)
>  rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.2.bb => python-openstackclient_1.0.3.bb} (73%)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

