Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.4749.1634612707839114823
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 20:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jj+lavcy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t16so7161961eds.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Oct 2021 20:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j8qov2NChFBRKhC0aDgOQcXnAfenq20Hi5Nrs9tKlkg=;
        b=jj+lavcyRBW0lmh6RgvdibOWsTvMZlh50go5m/QlCYQw/7fNpyE/voDVyQCiV8fGfT
         L0ndLStcG0JdwlWz4cmhOdeHcvp699a9tWqclFW/natD2NDeJ27BrdjzrdZnFx6KtUcB
         MlsMLtFDNR213F3AQkwhn1JF1wPWOWIfhLPcwJUeY6j646oB7pieq40uzbzKhrLbuMx6
         oXmesjJq2W+bzvmSTcpM2Evbvz0RRiglK4QxSLONYG23n7v3ZdQoAPnuyxj78xH4ld6/
         0rNIKUTyffco4IesXF+TUbx8r5c14ccBU+S998b1Di10VsryWyDL9R1DQZ80FnhPMs7P
         N/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j8qov2NChFBRKhC0aDgOQcXnAfenq20Hi5Nrs9tKlkg=;
        b=Pa0AfTmJhuCQrhsquL0SU26eFfeAvsoK6mJGOa9CGAZK6Im1bgAoGc33udLKABr5bm
         sk0SAslHHi52YS7Sgb3XE3ayHmEIl6usQFH88J+krAHN5YI2rmWpZQ32j8QyXD/2Nx9p
         3J4zKk19FaLBXcOTLbUi1hUEqSLP/Y9BtYP2F0Zhlea9XGsfb2qy8NmL/JNV1TqBJJf+
         XttiTwEa0RoLWmpgCMFrQOaxcXtIBTfzlKEuKlenlApDJ5SWnAWv93ZA58+6Of26W43D
         EamdZVwtRXkfz72UlhsbBFG4qzeNMTCBfW314b0U0s3CujZ4N+ESX/fi1stJJHsestxZ
         Wd9g==
X-Gm-Message-State: AOAM530k5VJwbCN8baIYKPwfNDoG/sFnsPgotYO/qnczPXQKj6+UwBFV
	/mrhxGAN+3W533cj7+ri/+CFNLNgI4DeY+COIFo=
X-Google-Smtp-Source: ABdhPJxU3aER1LGbABhCI2Y/kATe+NlPF2JnOFDURKxyOptIhT7BRp5/YA8K2cnJ/YnH1kPdIemYTASyaP9KOhwNFjM=
X-Received: by 2002:a17:907:984d:: with SMTP id jj13mr36346393ejc.211.1634612706353;
 Mon, 18 Oct 2021 20:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019025300.39608-1-kai.kang@windriver.com>
In-Reply-To: <20211019025300.39608-1-kai.kang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 18 Oct 2021 23:04:55 -0400
Message-ID: <CADkTA4Pr49xoseG0P1p_O0Ky4gn1cgxCBVFLJeOxCcLyFtOU8w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] ceph: inherit pkgconfig.bbclass
To: kai <kai.kang@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 10:53 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> According to oe-core commit
>
> 8e26252b45 layer.conf: Extend recipes not to install without explict dependencies
>
> pkgconfig-native is not deployed in sysroot by default any more. Inherit
> pkgconfig.bbclass to make it available for ceph.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * correct referenced commit

v2 is staged on master-next.

If this is needed anywhere else than master (i.e. honister), let me
know ... It wouldn't break anything on honister, but I'm trying to
keep the changes there to a minimum.

Cheers,

Bruce

>
>  recipes-extended/ceph/ceph_15.2.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/ceph/ceph_15.2.12.bb b/recipes-extended/ceph/ceph_15.2.12.bb
> index 6636d7a..693b525 100644
> --- a/recipes-extended/ceph/ceph_15.2.12.bb
> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
>                      file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
>  "
> -inherit cmake python3native python3-dir systemd
> +inherit cmake pkgconfig python3native python3-dir systemd
>  # Disable python pybind support for ceph temporary, when corss compiling pybind,
>  # pybind mix cmake and python setup environment, would case a lot of errors.
>
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
