Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web09.2169.1579225114254742548
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jan 2020 17:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tXw/v4T/;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id z22so24760048ljg.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jan 2020 17:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2N2gjK+jmG5PEUXVuHZ9O6FixQgRVqbvgD4hZAC9Kw=;
        b=tXw/v4T/0sl3+hC0HEdRmihrk5Xrus258I6gOlpq08zNLOLnk7NhC9yRzIGBG8TIYA
         3jyoG/dNfVdNN5z0Bag0/a+oxHTrucYGdaINZTyKR4iu64QPEVoNyri8pYcb27zloj0/
         NFuNrN/MjklEauK9SlNmWgjvVCDOAkMesNHNpMK93guoUuyxdrHwnXd/4KgAr6yVT2jG
         d79pi7CVj1seDnho3NzgPwNqy8XERro+QfHF6655sNe3prMtKiKKydQRY7TagRUPHWI5
         wUa296oGUZJ9FfARffvCqBs6tRqmDBIyqQpu18xWalJzV0t2vg1TbFPfJlck9IOtKb7I
         Pbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2N2gjK+jmG5PEUXVuHZ9O6FixQgRVqbvgD4hZAC9Kw=;
        b=Im9BbH/C4rIRye6NpIOsC1vzuiakO4FvtrUPxaS5TqCLyrM/S5YwUf1eY9tbleWCyq
         fUjSU00R/0G/Wi9W2TrrJjjjodkDOPZmjCNXmO0XjiXW7Ce0gglh8esRLDtHuQqpT7ZS
         LXa+n4MDNWl31+u3fNjhtUdlF53U5UuGaqGq50pgGost3rWIMX39h8kwjonhT9Q0G5mD
         uyL1c4Y9B6A83qOwQW/tX8S5qcL/z1b5g+DmUGFS40cvCWIyjz99iDXFnC7U78IPOXuj
         Tzod3Qz2Eis7jfAlsAlp+iWjQ8eF/3Frrt59rjXdyCveCNVhBNon1xGqg0EWIwI/6831
         p/zg==
X-Gm-Message-State: APjAAAWNlS8y0J0Uln7KROx3wp2XEmw07w6gpgwGS2YIUz8LIcUMZCCs
	C4agmg4MKKUz7DZiEu2DM8GY+zDOvNUnA/KX87c=
X-Google-Smtp-Source: APXvYqx68VngBCVW60ibngrqrDTnrh/dM8hiImr+AuC3QXAbKdkyHZ2ikQgIRgTHB2RhmDTPfhoRT6i5GuQMTmSJlpk=
X-Received: by 2002:a2e:9050:: with SMTP id n16mr4129731ljg.49.1579225112390;
 Thu, 16 Jan 2020 17:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com> <20200113154742.15509-2-brendank310@gmail.com>
In-Reply-To: <20200113154742.15509-2-brendank310@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 16 Jan 2020 17:38:20 -0800
Message-ID: <CACMJ4GaD4YQT2NG7D4ruwKk_0Hu5Dw5AdAxykxqir0EXCAH7PA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/3] xen: add flag to ignore warning "address-of-packed-member"
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Brendan Kerrigan <kerriganb@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 8:11 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 628e52b..a77b0d7 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -925,6 +925,8 @@ CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__
>                 '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
>            [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
>
> +CC += " -Wno-address-of-packed-member "
> +

I don't think we should make this addition - it looks like the build
issues that I think this is intended to work around have been resolved
in a more recent minor version of Xen 4.12.
Please could you replace this commit with one that renames
xen_4.12.0.bb to xen_4.12.2.bb, with updated SRC_URI checksums, and
verify that it builds correctly?

Christopher

>  # check for XSM in package config to allow XSM_ENABLE to be set
>  python () {
>      pkgconfig = d.getVar('PACKAGECONFIG')
> --
> 2.20.1
>
> 
