Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F8FCE00DBD; Tue, 13 Oct 2015 08:29:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEC3BE006F6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 08:29:28 -0700 (PDT)
Received: by ykfs79 with SMTP id s79so7813734ykf.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tQnfQ2HZXeFxYYkuvgKPcgaxgPJe08Jn7GVqesHl+J8=;
	b=N/2zftYXZtkliliLt4UIy0BG77SX6ccHJ1rTsog7YYlvjB20U3ds+YObv26qzEAkBf
	ZGnwTuKQjLj4tj+xjN/dOMZ5KiON8p1FxeDYdXHVhgWnysUtHn/21A1vUp7uxyYyElnf
	MudcaS4WD/6XHYs1RsF0QLhSBfXWW0mluhDPPUTiPyJfUxNtC4CNvTkkGLnXz7J2AWjd
	8t24OSDUdG9MOXWoyarotgr0CAyAFsoMs16zVvYE3dy40Z4YGcxrREfs4/VHcPP0or3P
	BJuqMRetqZXtP90UjruY8jgiw6GLDCUwZ1AJE2cV/simVeKLzPk3Q04o/75vX3rY+XPl
	0O0A==
MIME-Version: 1.0
X-Received: by 10.129.0.2 with SMTP id 2mr4634173ywa.127.1444750168046; Tue,
	13 Oct 2015 08:29:28 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Tue, 13 Oct 2015 08:29:28 -0700 (PDT)
In-Reply-To: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
References: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 13 Oct 2015 11:29:28 -0400
Message-ID: <CADkTA4OMKAuepbBE-cR8XvTKk_tfEK7m3Oi7qiW+3NS7Co+vaw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido/kilo][PATCH 0/3] openstack client
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
X-List-Received-Date: Tue, 13 Oct 2015 15:29:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 7, 2015 at 11:38 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> The openstack client depends on cliff-tablib:
>   # openstack token issue
>   ERROR: openstackclient.shell Exception raised: cliff-tablib>=1.0
>
> I've added the necessary recipes to satisfy this dependency, and
> updated openstackclient to a newer minor version.

Sorry for the delay, I was traveling and didn't get to this until now.

Any particular reason why you bumped to 1.0.4 ? versus something completely
up to date (incompatibilities with the kilo release ?).

I was going to merge this to master at the same time, but ran into the version
skew, and was considering the best way to get the same updated dependencies
into master.

Bruce

>
> Josep Puigdemont (3):
>   python-tablib: added recipe
>   python-cliff-tablib: add recipe
>   openstackcclient: New version and updated dependencies
>
>  .../python/python-cliff-tablib_git.bb              | 23 ++++++++++++++++++++++
>  ...nt_1.0.3.bb => python-openstackclient_1.0.4.bb} | 15 ++++++++++++++
>  .../python/python-tablib_0.10.0.bb                 | 18 +++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb
>  rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.3.bb => python-openstackclient_1.0.4.bb} (63%)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb
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

