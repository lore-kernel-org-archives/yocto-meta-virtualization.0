Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03E61E00938; Tue,  3 Apr 2018 20:24:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4D4AE008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:24:15 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id m200-v6so17386628lfm.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZuH+PKP1G3SyhiFvEZDXKWfu4Z8CLOmNoMQ3NxRGYKs=;
	b=f+R3iJK5uA2Yw1SNOxHJxu1r1I8JNtC1atJSkxnqFpSdwfP8EFf/39YrgNvL+yFXLO
	rqek7365eDjFHo2wWCmBKSc+iK2rMs1byRHojmRcxR6nPqnm9/8tVqeWtssRFW6T1kn6
	0vQBMDFUPzzDOZtJP6axkQB7mJUPK1TlfDZYzPQGQO3GfSt2SLaDvSWy6BAbS8JE3a8x
	Xm3zGuQBHcvWc5Hj2hxyuMkkyPmDlsg3iRQ9CUNolZKXd8eTP39/noD8ValO/vw7onMV
	f/yCmYU8F76AQJsRiZwviPuWEdjAd3asnMsHhv4lP3yIMfdBks1T05Fke6Xm8lgg87m9
	Xf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZuH+PKP1G3SyhiFvEZDXKWfu4Z8CLOmNoMQ3NxRGYKs=;
	b=CZDR0Pzcsu5nv97aXsTejo4AeTiqsZUICIkT41X37hbU8umMEJBlapNBc8qQrScKcM
	RgfzDfv2GRSiYDzBp2RvvMM9hyPDJDLeThxFmHRXqxmYz+UfsFuCZOZRwqVBNuC2hF+K
	s0r3g21FmbWUgRrt2mGR2H67hJADORUzjiYu5/FUC59X4uEPBDrNvtyqXms/KbCqajCK
	iLeouFblkgrIHjCWNIqWcv8jzyLdimAsqAtzGH2XHPE2OG/mAU4U58/LnnAtGyJL8tlC
	7tZ1FqJ1fRoow5UkwC2766RnDCA86jdvFW2Udx8fQsZIhXphgxMW1zDx91L6PriPF7z4
	oL1Q==
X-Gm-Message-State: ALQs6tD9TXwZXUGJI59CARKN0dxD+Or9nPEZlVT/BNrahWXflIHDbV61
	aWBc897GqxVFApJialEoczINf0QDMBcIZRKDqlM=
X-Google-Smtp-Source: AIpwx49+Enjwvv8Jqr8snqTOsir+zIgAJKAfEBjgYNtmBaGGN01RlC8RoO0QDMLZHi6tVxkd03zPwMqCHoAgkZ6BUI8=
X-Received: by 10.46.128.84 with SMTP id p20mr323271ljg.12.1522812254246; Tue,
	03 Apr 2018 20:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:24:13 -0700 (PDT)
In-Reply-To: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
References: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:24:13 -0400
Message-ID: <CADkTA4Pc97Vo6sxp-P3MzAZUHE3ojDOnqAW2mAKKuxK=sUK87w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/3] postgresql: follow move to recipes-dbs done in meta-openembedded
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
X-List-Received-Date: Wed, 04 Apr 2018 03:24:17 -0000
Content-Type: text/plain; charset="UTF-8"

The series has been merged.

Bruce

On Thu, Mar 29, 2018 at 3:29 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Commit 742404cc8ab0 [postgres: move to recipes-dbs] in
> meta-openembedded moved the postgresql recipe to recipes-dbs. We
> usually try to match the bbappend's path with that of the bb so
> complete a matching move here.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql     | 0
>  .../postgresql/postgresql/postgresql-init                                 | 0
>  .../postgresql/postgresql/postgresql-init.service                         | 0
>  .../{recipes-support => recipes-dbs}/postgresql/postgresql_9.%.bbappend   | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql (100%)
>  rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql-init (100%)
>  rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql-init.service (100%)
>  rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql_9.%.bbappend (100%)
>
> diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql
> similarity index 100%
> rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql
> rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql
> diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
> similarity index 100%
> rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql-init
> rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
> diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init.service
> similarity index 100%
> rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service
> rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init.service
> diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
> rename to meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

