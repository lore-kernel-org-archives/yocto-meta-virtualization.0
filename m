Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.20990.1607634073329006947
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 13:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pzH1EO9f;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2F13838C13A4
	for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 21:01:13 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id dk8so7074532edb.1
        for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 13:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aFC96M7JM+DqvTsMmwEom8p2h6W5JZTiTCfv4zuYRs=;
        b=pzH1EO9ffgnTddtzflH3uh/Ys6VfUOK7X1ZnlKC8t5rDffszPXDOGWmQJptg7c07t6
         KPgvSurffC+bd6BtK+OtEsK2nJw6vQ0M5JaIgqQyksTMcDXenY3/dZJUiR3tuOhGo6Iw
         m58NjIgmMSuK8aL5hqfAD3F7md2qUTr7BWuJ45HjfpdCfjy/xlgvtDzDJZGRC0SVGVGI
         JoG9bxms+ibkO7IAcO/f0Mt4XRB+DH65NdY/7ffxSNSwMYfuPpb7vY7QPyNVAJRz3oOh
         Hx6ugRKSM4GR8BlWX6WQXA/i1xjMA6JRVyPsuQocwSrh+Bm3Uert/J+y9T0RB0T3azq5
         Wpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aFC96M7JM+DqvTsMmwEom8p2h6W5JZTiTCfv4zuYRs=;
        b=ZpGGb38ruKrs6NSotn4j/ISIu9CeFXKC5+xHci5BUS4dtuhekW0jmQtxnuorXBAV+8
         0k0XscggOopYeU1d4Inl8nJiP1D3axG7WK5s4TboMg1ovLx443kYI+2s2bqRI7xjyHe3
         5MbBpXHhrNSXlvJWp7qaA5KYVwDWFRKpRM1m4a3asyqN4PlxQc9N4VYTJApJ/wtKtjhf
         bac5Sj2dJEn4E4RZrHpjDXVmYO/5u11B4fnzHdQCKqoBwYjWClbqoJc3ryLFtdNIho6b
         q10r207iYRzOYK+RH+vv6cOTEm0GANhZ5AvTHLS3caYJR7EjkZUj8Sj3ZutgMLQA9t9p
         aSgw==
X-Gm-Message-State: AOAM532eXvRWQC+3+JUAvpMMXu1eiZdTVDqVhAsAHcb9IVPbI9OZgr4P
	eoSepSqKxKjdEaYtpMR+IHXI8Rx8/7GaX1ex2cYH1m+EcJDYsw==
X-Google-Smtp-Source: ABdhPJzuU9iMwGQpFC0JEcZvQBk6xJilaBAiib/2f29urdSZPb7JGAv0sfvqEzExLQ6Y2tGTXssiIiZYnVrJVBq6mAA=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr8927139eds.352.1607634071533;
 Thu, 10 Dec 2020 13:01:11 -0800 (PST)
MIME-Version: 1.0
References: <16483063CB70B824.5807@lists.yoctoproject.org> <655aec7943784ad28bc7a557cbb7fada@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <655aec7943784ad28bc7a557cbb7fada@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 10 Dec 2020 16:01:00 -0500
Message-ID: <CADkTA4O7XcDKeqWCcPL4QLgbsVXH9Y-++Z_V5DxU3_0iQFHkLg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

They were intended to be merged, and I don't see any in my queue that
I missed, so yes, please re-submit the ones that I missed.

Bruce

On Tue, Dec 8, 2020 at 1:28 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Ping
>
> Hello, I found that none of the patches submitted on November 17, 2020 have been merged. Do I need to re submit these patches?
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-
> > virtualization@lists.yoctoproject.org> On Behalf Of zangrc
> > Sent: Wednesday, November 18, 2020 12:14 AM
> > To: meta-virtualization@yoctoproject.org
> > Subject: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
> >
> > When I tried to change it to python3, it reported the following error:
> > | pysqlite is not supported on Python 3. When using Python 3, use the sqlite3
> > module from the standard library.
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  .../python/python-pysqlite_2.6.3.bb           | 22 -------------------
> >  1 file changed, 22 deletions(-)
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-
> > pysqlite_2.6.3.bb
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> > pysqlite_2.6.3.bb b/meta-openstack/recipes-devtools/python/python-
> > pysqlite_2.6.3.bb
> > deleted file mode 100644
> > index 6b8de00e..00000000
> > --- a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -DESCRIPTION = "DB-API 2.0 interface for SQLite 3.x"
> > -HOMEPAGE = "http://github.com/ghaering/pysqlite"
> > -SECTION = "devel/python"
> > -LICENSE = "Zlib"
> > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=a85bd923e5c830f8eb89db354ff72f38"
> > -
> > -SRC_URI[md5sum] = "7ff1cedee74646b50117acff87aa1cfa"
> > -SRC_URI[sha256sum] =
> > "fe9c35216bf56c858b34c4b4c8be7e34566ddef29670e5a5b43f9cb8ecfbb2
> > 8d"
> > -
> > -inherit setuptools3 pypi
> > -
> > -FILES_${PN} += "${datadir}/*"
> > -
> > -# DEPENDS_default: python-pip
> > -
> > -DEPENDS += " \
> > -        python-pip \
> > -        "
> > -
> > -# RDEPENDS_default:
> > -RDEPENDS_${PN} += " \
> > -        "
> > --
> > 2.25.1
> >
> >
>
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
