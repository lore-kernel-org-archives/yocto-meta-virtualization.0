Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.8893.1637328534953179281
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 05:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cakDUVz9;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id x15so42801768edv.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BRHw/ozKYVSCagxtp0oapW6KPEOLnQyvC/eX1spcnrg=;
        b=cakDUVz9zSSu62JXpMjq+WPAKTwgI711XG4PhMigH7IQ1uMFhx0gl3lth7u31/FmbI
         MdcQou6sjcZlc8pI/JkxJhITEJor52pdiGJQd1R7MHH9Xdx0YpvLPR6r+Vz5cfYbtBRo
         hoEHkjJolhl5jfCjHzITrSXzVbY4hQD9w/1dTGNXAYkm69nOlVnt0T0TB0KgCE9vshMU
         xM0IzZcDGRXuxQ0tcRJSz6H3TQ4FIS4wsNNKwPBJ1NzOqBH35Bfgjlnd/CcvpphN9vOP
         7N87Zs9dXAqsvLtAdEuzGSGa7QTAJbMd3Bf6DCAtuPaYMNGv7Vsw739YW8wDCHQP2+vD
         1akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRHw/ozKYVSCagxtp0oapW6KPEOLnQyvC/eX1spcnrg=;
        b=y0fXlddINH+HGpbgjoybXAu9t8zlSjFCqv/T70jjwJQlqDdMZu/Gop/PY4rKXDUqVU
         MH/QMS4OKNExj0OO8GssN/KQFl6h/a4ifX/pIPdROBOdFEcTqaXLAGR51szRgh7hRwXt
         cTCMnyrJLwImzG+5l/beHe4dfZxJJsB6z9CuTiKrEbTCNhmYRhpXWj11jQLRX1lN8vgW
         Vqf8ZzOMiILRZ22UOhxRcBzkSxJnVz5t7n2k79Ae5s5JOUpc2L0EImw5yqyy9+sGQcZ1
         /4du6JaATopCQBLVjhEPFKpZFHinZ+c8kPJb8jbN7uEXlxQ5sCvb2PJCgLGQXA6fh3T8
         aVpw==
X-Gm-Message-State: AOAM530vSz+0j4POiPH7rme89n9d1JtXns0U81AWPEWNcodLqWKinL9t
	A4Comr+1ixYI9xP+VaEFmnpqA8lzxMv8Q26wRys=
X-Google-Smtp-Source: ABdhPJxssa0SqLrsqyKqLH4uK9mfkpnAhE0VOl2ayZ0HAmXexZvOZoPWp8WsiSyJdFkHz0Ml7Vnh2ph9YLpuEJAEf4g=
X-Received: by 2002:a17:907:1c0a:: with SMTP id nc10mr7892208ejc.211.1637328532868;
 Fri, 19 Nov 2021 05:28:52 -0800 (PST)
MIME-Version: 1.0
References: <16B661A3874E3006.9335@lists.yoctoproject.org> <6e0222bd-7bf5-dbb3-d469-3f2356dcfaa2@windriver.com>
In-Reply-To: <6e0222bd-7bf5-dbb3-d469-3f2356dcfaa2@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Nov 2021 08:28:42 -0500
Message-ID: <CADkTA4POvRijPX88eOfyp_iyiTcirwJgRLros4uF43ytNG-G8A@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] open-iscsi-user: remove typo spaces in SRC_URI
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 19, 2021 at 2:10 AM kai <kai.kang@windriver.com> wrote:
>
> On 11/11/21 11:53 AM, kai wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> There are typo spaces in SRC_URI which are introduced when add
> ';branch=master'. Remove them.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> index d4c489cf..fe802b72 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS = "kmod openssl util-linux open-isns"
>  DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
> -SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \
> +SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
>             file://0001-fix-build-error-of-cross-build.patch \
>             "
>
>
> Ping.
>

I was waiting for you to reply about the comment on your other patch
in the same send (the ruby branch one), since if they are sent on the
same day by the same person, and there are comments .. I tend to treat
them as a unit.

But I have gone ahead and merged this now.

Bruce

>
>
>
>
>
> --
> Kai Kang
> Wind River Linux
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
