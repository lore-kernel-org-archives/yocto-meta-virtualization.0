Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84522E00B85; Tue,  5 Jan 2016 08:36:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35C24E0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:36:05 -0800 (PST)
Received: by mail-wm0-f45.google.com with SMTP id b14so37571984wmb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=BsC7eG/mf6RpMc63B32gwbnyr76GUzsggSDlVu/GsSw=;
	b=qcZyvD4KOJDa9+ZuirDj2MknK+e4P6Vzr28S7M+HKiQtC09v0Y7LyPDbqbrR6qI/k3
	QcCGr1T6XCWT7yiwgJW7kQW00tpzcccV7Tkod6uT8hIJu53RSMLG09ba98+rXwkIP0BA
	R0Z64exLIPpcw9NWIheHuMtPPL0kCMM6kLeEN+XUHx4oF5V4de5dfBjiGXIZ4h4KLWAp
	w+77Vi/JoJ3UhC/9iLkI3PlCvjh9UA8WahCRGraer2cbH1UBiE0h15IxBSXaQNxKsalp
	aIGjl4v0lmhUJRcVNfq3A8Mh+cq1yDGlsCSMklGYXQnBURNvKgUffR6aIjTSxCcqCI9a
	ZAbw==
MIME-Version: 1.0
X-Received: by 10.28.129.202 with SMTP id c193mr4849101wmd.35.1452011764480;
	Tue, 05 Jan 2016 08:36:04 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.203.130 with HTTP; Tue, 5 Jan 2016 08:36:04 -0800 (PST)
In-Reply-To: <1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
	<1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Tue, 5 Jan 2016 11:36:04 -0500
X-Google-Sender-Auth: MueTDHs1dkweUMuGfTl_lHL1Nqk
Message-ID: <CAPuovEL8oEF=+rz2N-t9aXwfr=sV8U9PrCCO4YR+NeO2T0=Qzw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 00/21] Error fix for recipes depend on python-pbr
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 16:36:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2016 at 9:00 PM, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:
> [PATCH 01/21] ~ [PATCH 21/21] are recipes depend on python-pbr.
> And they will download pbr modules in the step of do_compile.
> If your network is not very well,errors will occur as following:
>   Download error on https://pypi.python.org/simple/pbr/:
>   [Errno -5] No address associated with hostname -- Some packages may not be found!
>   Couldn't find index page for 'pbr' (maybe misspelled?)
>   No local packages or download links found for pbr
> so add do_compile_prepend to fix it.


When there was one of these I think the solution we put in place was
sufficient but now with pbr and the dozen+ instances being fixed here
we might want to handle this in the python bbclass. We could have the
pbr and vcversioner recipes set a flag that will ensure the egg is
created and then recipes which require the egg have a list of
REQUIRED_EGGS or similar to indicate to the class that the copy needs
to take place. Thoughts?

Mark

>
> Li Xin (21):
>   python-pbr: Error fix for recipes depend on python-pbr
>   python-cliff: Error fix
>   python-fixtures: Error fix
>   python-glanceclient: Error fix
>   python-heat: Error fix
>   python-heatclient: Error fix
>   python-keystoneclient: Error fix
>   python-lockfile: Error fix
>   python-mox3: Error fix
>   python-oslo.config: Error fix
>   python-oslo.context: Error fix
>   python-oslo.i18n: Error fix
>   python-oslo.log: Error fix
>   python-oslo.serialization: Error fix
>   python-oslo.utils: Error fix
>   python-sqlalchemy-migrate: Error fix
>   python-stevedore: Error fix
>   python-swiftclient: Error fix
>   python-testscenarios: Error fix
>   python-testtools: Error fix
>   python-wsme: Error fix
>
>  meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb  |  7 +++++++
>  .../recipes-devtools/python/python-fixtures_1.3.1.bb           |  6 ++++++
>  .../recipes-devtools/python/python-glanceclient_git.bb         |  7 +++++++
>  meta-openstack/recipes-devtools/python/python-heat_git.bb      |  7 +++++++
>  .../recipes-devtools/python/python-heatclient_git.bb           |  7 +++++++
>  .../recipes-devtools/python/python-keystoneclient_git.bb       |  7 +++++++
>  .../recipes-devtools/python/python-lockfile_0.10.2.bb          |  6 ++++++
>  meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb    |  6 ++++++
>  .../recipes-devtools/python/python-oslo.config_1.14.0.bb       |  7 +++++++
>  .../recipes-devtools/python/python-oslo.context_git.bb         |  6 ++++++
>  .../recipes-devtools/python/python-oslo.i18n_1.6.0.bb          |  6 ++++++
>  meta-openstack/recipes-devtools/python/python-oslo.log_git.bb  |  7 +++++++
>  .../recipes-devtools/python/python-oslo.serialization_git.bb   |  6 ++++++
>  .../recipes-devtools/python/python-oslo.utils_git.bb           |  6 ++++++
>  meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb     | 10 ++++++++++
>  .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb |  6 ++++++
>  .../recipes-devtools/python/python-stevedore_1.6.0.bb          |  6 ++++++
>  .../recipes-devtools/python/python-swiftclient_git.bb          |  7 +++++++
>  .../recipes-devtools/python/python-testscenarios_0.5.0.bb      |  6 ++++++
>  .../recipes-devtools/python/python-testtools_1.8.0.bb          |  7 +++++++
>  meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb    |  6 ++++++
>  21 files changed, 139 insertions(+)
>
> --
> 1.8.4.2
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

