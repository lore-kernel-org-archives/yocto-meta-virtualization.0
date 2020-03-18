Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.16485.1584541881928029823
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 07:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sN6t8pl+;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id z3so13572584edq.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Mar 2020 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eC/9Ay8LmNZrPFxq+3vevKuUdZV4bRVXAvML9sqI5j8=;
        b=sN6t8pl+k2fq/BSsRPlkMSKDi7bP9U4c7JjFmB0qJtA0NPEqoJFzXgtbFHeiAk8ceY
         n5KCKp+ZWiv7xyb2W+ecW1tsNWozk9OAshOCRpllhzoMU1SdySmO+N/3xxOk+I2Y8tem
         vo002UH+IsnMH73Jd8KbF6iNqkGk2XZvG4e00Kxi6BfLdIrBWUz1CwPZxOM/DTn5KyyN
         tqMPXqRnaZ3b6iSh2Blw1ddarq5HIJM7mVsuWeAs6++RDi9Z8VHFrfa27Q/1Zm8NEvr0
         eRrN2/asu8o7cqVw/PhfL4K5sKQAYK8r1rUaKFlilyrv3lkMTquXhQdQlOclvGgVp+nB
         fJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eC/9Ay8LmNZrPFxq+3vevKuUdZV4bRVXAvML9sqI5j8=;
        b=mXbONGncK1RopIQ+9hRtQrvzUHXOorC0BQW6V5HPEaijF4y63OGHxKkdjehGOu8s7G
         4g2uO+eUkIMChs2FygRKM5xa/+v7mW+kyKzMWHbdXMmGRw9GiG6RiuwCedPE9s2giDW+
         8ZqouvsuciWTp2UpyYpnwPiyK27iXfg4okVsSiLqeEOS/ZDEaxjUT3EgWdCbcPSIdK/8
         SYD1aVUDdMjgsu6hWczPOpeglYlZvMnDKEm+GXQ66xC3xjNJV7YGsAmOZrhCiEI3qZy9
         x6ovtqrF/bd4QfSkjRDrjWZmvQsOdbeBdPBCelR4oe8TOcWDtzTzLrjCboQaLz1bLZQ4
         x/TQ==
X-Gm-Message-State: ANhLgQ2ogRqFJpkF9fBuqhuGabae0n+fLOfn7OpdpBi1akYc4Je6kjIc
	w68DsdbRaUvt+s3KSDfVmvNFOOZKrAW/UMb8QIM=
X-Google-Smtp-Source: ADFU+vsxWIpJ6BJ804RTaBW9bTQOUjzjlo+e+kDlii2g3/ivI5fGqteyotWbYRrFRD6Egn5sMXbI6k20+/z8kAY3epA=
X-Received: by 2002:a50:fa81:: with SMTP id w1mr4000639edr.365.1584541880478;
 Wed, 18 Mar 2020 07:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200318161231.62892-1-Daniel.Dragomir@windriver.com>
In-Reply-To: <20200318161231.62892-1-Daniel.Dragomir@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 18 Mar 2020 10:31:09 -0400
Message-ID: <CADkTA4MUDnQGGb-+WYe9Eg9+6GqXdjRZ=HJ+GXgcmGnU5CeDwA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-build: drop distro_features_check
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Mar 18, 2020 at 10:21 AM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> Replace distro_features_check bbclass which is deprecated, with
> features_check bbclass.
>
> Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
> ---
>  recipes-devtools/go/go-build_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
> index 4ea800f..c11ad99 100644
> --- a/recipes-devtools/go/go-build_git.bb
> +++ b/recipes-devtools/go/go-build_git.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=945fc9aa694796a6337395cc291ddd
>  S = "${WORKDIR}/git"
>  PV = "0.1-git${SRCREV_runx}"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "vmsep"
>
>  inherit pkgconfig
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
