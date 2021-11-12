Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.10988.1636689810090385246
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 20:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G1WlfRGM;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id m14so32725444edd.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 20:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jICq5y0J9xHqsqF8CaiGXz6gNB/E3WuAuF97ZZHClZI=;
        b=G1WlfRGMoCQBAzrdQk3zZtNchjA4gBLTIljXvEcLv8XKb0lobFnOEjCWdowm5d3oiz
         xUTrPr19qukHGOAfBDALx8b+CoesCM476gChwSQxyV17K6burxa9IFCeq5xdA3x8RCVf
         UQ0fLqJheU6IgJ7u+ktIScKYzboBy5NNPhVEoG+hp2QxUO/lm4qF/yyqyuXf/A+KuSfs
         CESmzEbBKXvuw8qDhv7Qes8SbRi1xpm+RZ/HiBFzVBn28YsWYOe7PVRZqbr7RzFg7Nq7
         mdSNtB0iSfEVe+/aA/Q+3dsUCigzu8pAnIY94vG1eguZMl06jaAZiVRte7FHFh2NdJYn
         GFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jICq5y0J9xHqsqF8CaiGXz6gNB/E3WuAuF97ZZHClZI=;
        b=wa6Qf7OCYx3wiuy0d0aT4SeIseQ1Xyrdb/qhPStFDlYyKblU98sQSpsKwDsHxecAeO
         bn77JjC61QRCgzthliovtNeWogqQKJD/4wNUgzO39WopIcE77OSs4HTyl37iSxVoMpZ2
         CjbkVU+XWSjeTAfQOQOL/x3npCk5Y0ZQYUvRMOO/rnTlqK2a5N9PpcUqzm/jwPW+azzE
         9Xwv7/3o7GJBhV28ee9skX2/OHePSTU54Qx20Fy4OQUxki8c/QPKFBjjr4YhveAvDtGA
         62Y8qA+Gm896RO0VbDUEttSosyjTsj+DlRr5YfqCK+4E2oSmjcc501rLtuqE0XRhnYfa
         2/KA==
X-Gm-Message-State: AOAM532lLfqgPe16zXo1jsBm+zhwVfURAFRaQxLSs9BzB0S020F7c4Oo
	QMu2d7ZhuyslMPIrVmaIt5JRU9vRcyncER5aAYtM2Kggdro=
X-Google-Smtp-Source: ABdhPJzMTVoDF2XEol3HcDdqeAfJgVhsbMWd9KC8SHpA16Ua5N+JOPRgDPMlPSj1GYM+tUugW4qUBT3avrxQhzlIA38=
X-Received: by 2002:a17:906:4fc4:: with SMTP id i4mr16691945ejw.81.1636689808077;
 Thu, 11 Nov 2021 20:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20211112032335.5922-1-kai.kang@windriver.com>
In-Reply-To: <20211112032335.5922-1-kai.kang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 11 Nov 2021 23:03:17 -0500
Message-ID: <CADkTA4O6W8QHsSrsWuc-_CM8yBo=QgcVBBynOj-92UbWwftNAA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: do not install /var/log for target
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 11, 2021 at 10:23 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> /var/log is normally a link to /var/volatile/log and /var/volatile is a tmpfs
> mount. So anything created in /var/log will not be available when the tmpfs is
> mounted.
>
> Not install /var/log to avoid 'empty-dirs' qa issue:
>
> | ERROR: libvirt-7.2.0-r0 do_package_qa: QA Issue: libvirt installs files in
>   /var/volatile, but it is expected to be empty [empty-dirs]
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_7.2.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index b7f8383a..b49bd11a 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -232,6 +232,10 @@ do_install:append() {
>         echo "d root root 0755 /run/libvirt/qemu none" \
>              >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>
> +       # /var/log is normally a link to /var/volatile/log
> +       # and /var/volatile is a tmpfs mount which should be clean.
> +       rm -rf ${D}${localstatedir}/log

We should be preventing the install from happening at all, not
deleting it after the fact.

If libvirt thinks something needs to be in the directory, then we
should be looking into why it does exactly that.

Bruce

> +
>         # Manually set permissions and ownership to match polkit recipe
>         if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
>                 install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
> --
> 2.33.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
