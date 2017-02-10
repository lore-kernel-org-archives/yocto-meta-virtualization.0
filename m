Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D95CE00546; Fri, 10 Feb 2017 07:52:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FBFFE004D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:52:33 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id v73so2857263ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6WMceGIbM+SKdskeRh6NMX/P66SBIHLuTY6xciqGqDY=;
	b=K1JdeTxi21wBsoyOsk/+zX2zAJJJmlrTFLeL8BBEj0zPltzk6/vg+fYBJtCsyCoGQx
	eqDSaBcSbY7zngytJFrXHiCNdFsQRkZQsOyR/T/XcUDFHUQERRjS/wN+KfQnm0Om9mY5
	u/hIlz+nqsWiRxBisis5HAwcIOt9ju928rp/tf7EVrzIRMO8uqVdF1bxCv2LYPR0zOlE
	0hSjc0Xsa0emp9qXBDJmZjb3VjrkQsNryu6O/b05B+4k/knuv+/2FTlYvbvDSm9gULpR
	exfmH8P/NBcEEGpvxADOi8VRF+kuJV+velyPu+kT/DrObGqF6VeQ5Le6z8Lb8Zqg0gly
	IsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=6WMceGIbM+SKdskeRh6NMX/P66SBIHLuTY6xciqGqDY=;
	b=jslRlYh9LG03ivLY5aXRFXdDL0HDVOmaqu7OxcV0oWW3Shf0EUt6hPwo1j2nrqVPx5
	x+pC5bdgOTIMNbkQapX2b+qN/+WcEyKJ5XL6b5RinlZotGu6gKYOK08+xBrzyk3qe6al
	gjKvIJIigT7dLbi2rIuqT0Joc0OpxQPuDW//qFtK+03eD610OYATbgTEhVuLLu9uorep
	LKmob2ElW5X8l37A68pfnoKvfNdIJFkzbfV9zDlLauMaMLiEKprmPf0AI4cqG1ADn7L0
	wSf7mLd9Ts/5jDv1Pe+/k96C0YQfdHqB5Z9mOlNN2FBHarb4u8mWTr3PjCnFg/dDexQ8
	QcmA==
X-Gm-Message-State: AMke39mVJ0PA7OoGs4jBwExbBDTE/8XNhHLc8H6eg9CrfbwQwijB+WsWALkEmEKJLz9M7BN4yS9O/WjbdeNMDg==
X-Received: by 10.129.84.66 with SMTP id i63mr6893517ywb.306.1486741952844;
	Fri, 10 Feb 2017 07:52:32 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Fri, 10 Feb 2017 07:52:32 -0800 (PST)
In-Reply-To: <f1199458-5c38-38c3-9ed2-a3c91d434b60@windriver.com>
References: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
	<1486741468-4476-3-git-send-email-mark.asselstine@windriver.com>
	<f1199458-5c38-38c3-9ed2-a3c91d434b60@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 10 Feb 2017 10:52:32 -0500
X-Google-Sender-Auth: 8KiftJ6RpVb3nEn0Hj8eP-yHBbY
Message-ID: <CAPuovEKi158=-2Wdaa+Rv-Hs4tJpV6pPAbLoEFnyuu1387dsXw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] runc: uprev to version required by docker 1.13.0
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
X-List-Received-Date: Fri, 10 Feb 2017 15:52:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 10, 2017 at 10:48 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2017-02-10 10:44 AM, Mark Asselstine wrote:
>>
>> At the moment we only use runc in conjunction with docker. In order to
>> allow docker to function correctly we need to use the version
>> specified in docker's vendor.conf file. Uprev runc to this version.
>>
>> NOTE that the docker folks have actually forked runc and I have used
>> this fork as the SRC_URI. I could have chosen instead to use the old
>> SRC_URI along with the fork point commit as the SRCREV, and then
>> applied the 2 commits the docker team have added beyond the fork. I
>> opted instead to use the fork such that 'docker info' would not
>> complain about a version mismatch. This also makes it easier to google
>> for issues since the commit ID matches.
>>
>> NOTE when we eventually have more users of runc we will have to
>> determine a strategy to either have them all use the same version or
>> allow for multiple versions of runc on the system. This is also true
>> for containerd.
>
>
> We already have more users of runc, so I unfortunately can't take
> this uprev at the moment.
>
> There doesn't have to be multiple versions on the target,

OK, as long as we are not expecting multiple version on the target at
the same time the split is a good approach and I can make this happen.
I will send a V2 with these changes.

Mark


> but we
> need to split the package into "docker-runc" and "runc", which is
> what other distros tend to do.
>
> So I can't take this update at the moment, and we'll have to work
> on the package split before we can do the update. We need all the
> components to be individually updated without docker dictating the
> revisions.
>
> Bruce
>
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  recipes-containers/runc/runc_git.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-containers/runc/runc_git.bb
>> b/recipes-containers/runc/runc_git.bb
>> index 23c0094..c5cf40b 100644
>> --- a/recipes-containers/runc/runc_git.bb
>> +++ b/recipes-containers/runc/runc_git.bb
>> @@ -4,9 +4,9 @@ DESCRIPTION = "runc is a CLI tool for spawning and running
>> containers according
>>
>>  # Note: this rev is before the required protocol field, update when all
>> components
>>  #       have been updated to match.
>> -SRCREV = "1cdaa709f151b61cee2bdaa09d8e5d2b58a8ba72"
>> +SRCREV = "2f7393a47307a16f8cee44a37b262e8b81021e3e"
>>  SRC_URI = "\
>> -       git://github.com/opencontainers/runc;branch=master \
>> +       git://github.com/docker/runc.git;nobranch=1 \
>>         "
>>
>>  # Apache-2.0 for containerd
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>>
>>  S = "${WORKDIR}/git"
>>
>> -RUNC_VERSION = "1.0.0-rc1"
>> +RUNC_VERSION = "1.0.0-rc2"
>>  PV = "${RUNC_VERSION}+git${SRCREV}"
>>
>>  DEPENDS = "go-cross-${TARGET_ARCH} \
>>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

