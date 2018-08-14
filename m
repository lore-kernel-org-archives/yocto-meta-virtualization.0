Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F783E009C2; Tue, 14 Aug 2018 09:55:56 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C56BBE00A39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 09:55:54 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id v22-v6so14252870lfe.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BgT8GVSgtaqmqWgGSzfk2Khrfz2+XCtsWahJHn3TS/I=;
	b=iR/1I1o+EQtxno0p+APeC3JTaJQX1aTX3/fFbtD6jBue/o54L4eR0AbY1sVUxfGhqe
	FNldFT7tAjbdHOV8nYrDKO9VnV6vEANbI0layNdsDhJ5rPJG6QL6fJJnKkadCXelkaNl
	h7JzLFkUsQ8qx+nsQwBSm2/5/sYPM1vxY6iPH7FttKXgWuAbJfJ2o2pR9o/0MboX3bVs
	sD9rZjgyYovJwQzfHpu7oVQj8kPT8v6DJbTXK688iQJHuGz+jdVRBOfC0JKfMvFcLOoS
	yi6M+EanklNZivNMvnCT8Zli7KXW5newEUGU5HSJTBt5n5oIREx3k8mQSL63HR/roAs4
	Ig4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BgT8GVSgtaqmqWgGSzfk2Khrfz2+XCtsWahJHn3TS/I=;
	b=Ykvqw//bEnTEjRj8U/t5xj2sQcz4Yzt6SH/Ld5BXYLdlVsZUPuod+W7YXevfWdMP4R
	rS5j15iUxr9c3IAV5DSi0d3SrnEV024SZ/b0GyvOGbjKp59dPBFT47vED9zkq+zVi0PL
	3GE64Ge/Yv8QoTJiUi31vQ8teMm4k94K3L9UqZ5wRBafPKwMeOqWXWoXzkJG4Tw7hnKu
	xjpcQNOj7lgDALChjhY5tULmFbxvUqwbNJEXVEoEL/St7t+Gz++STO1JUxXCBJ36MITy
	6nUjDhf4KsKYHRe2uibdGMdR8uBrCxaax3u1KTltsGKwLhC2mi2jtDHkpvmTlXMZd3D1
	FRXw==
X-Gm-Message-State: AOUpUlF6HJru8nKSoRVYpLdHDrIAcr+BYehuWh+J2lz9Fmvqg4Zk6xYl
	mfdz9H+6fxz3s6pxeghNSIl/nKZ8ko4f5gh9yFBtLg==
X-Google-Smtp-Source: AA+uWPw6Drhh8ntlT50qq6HWn5mzkGLU+Pfwmws7jA6OEACvhWeTQhgwKCjGfqtbmCt2Y6tZLTAhJHlbu0t7HzFvLoM=
X-Received: by 2002:a19:ebd7:: with SMTP id
	f84-v6mr13954240lfk.18.1534265753441; 
	Tue, 14 Aug 2018 09:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 09:55:52
	-0700 (PDT)
In-Reply-To: <1534222367-14053-1-git-send-email-dengke.du@windriver.com>
References: <1534222367-14053-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 12:55:52 -0400
Message-ID: <CADkTA4Oreg4ceWWTHsw+LpSnUViZ3u_hsdgCZxNsRxOjBXi6xw@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: add runtime depends for util-linux-getopt
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
X-List-Received-Date: Tue, 14 Aug 2018 16:55:56 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 14, 2018 at 12:52 AM, Dengke Du <dengke.du@windriver.com> wrote:
> When runing:
>
>     lxc-create -t download -n test
>
> The system reports that the getopt command can't find. This is because
> the lxc-download template depends on getopt command. So add the runtime
> depends on util-linux-getopt for lxc.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-containers/lxc/lxc_3.0.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/lxc/lxc_3.0.1.bb b/recipes-containers/lxc/lxc_3.0.1.bb
> index a77dd09..d4bfd92 100644
> --- a/recipes-containers/lxc/lxc_3.0.1.bb
> +++ b/recipes-containers/lxc/lxc_3.0.1.bb
> @@ -25,6 +25,7 @@ RDEPENDS_${PN} = " \
>                 gnutls \
>                 nettle \
>                 util-linux-mountpoint \
> +               util-linux-getopt \
>  "
>
>  RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
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

