Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26D4AE00D5F; Sun, 25 Aug 2019 19:23:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FECDE00CD7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:23:11 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id x3so11054408lfn.6
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+t3BrFlsqDo0f30zmpMVFQOmx3GBJz2NOWLv5aSBXgU=;
	b=GXJ5y+MUdckoBYEQlA1+hwzWOZa12MT4fWsaofunRXakYxLD7Jb7VjAkjRt6PjlqlI
	6T5rD6C3HUqgwYRd2b0u9n67CGmogqFqtpPALgn01+yVGMs+WcoZmm6tMLn/ZUIDmLZX
	lEFMavKW7jbGYGBR5OOnY93J3wkhP/HqZZfvKsA5P8qkcq+28rD4M5Slv3ASjdnCe4Cr
	pPBnQt26zE4TOe2Llv/Y438eRSMDwsptry8cWGp8pUk79CqQHFOwAfzVCmpJdhr7P/lC
	xMZhCQBNwRugT3Skj9hiV4R2id8hHJrll02VbPZjf6DWdzvXj6HjISSU6c3tf9G1lx48
	NPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+t3BrFlsqDo0f30zmpMVFQOmx3GBJz2NOWLv5aSBXgU=;
	b=nZJADNg81TQo/zQM26Qo+Q3kUu3YJ/Bz249onmYrw2t2rUZ5vy9Blm7PxxRM9uYK60
	Bj4fyONgY2I5KBocHDZla/kk6KAkf71ASkKFqeUfwThLbc2BKh488jtM3IgN9vuMX9oB
	9wAj8n9OCJUq/K7uj3RaYmjKwQuqcD8LNyM2UYMWu8MgWziinAsvg7QG7sFGFRKJA9dv
	XFFMVxwmXYMC8jigBuAiFH2RfDorDXQKvGylyzg1Fc7F18jvwplYSXA7Hhdq4UZLkYLt
	MTJXR5l+eCxERvgWvJiua92QhR4o3RCyTAn+VoAx/cpsxcxmaPglJBET5nOi3j3hYVgC
	+N9g==
X-Gm-Message-State: APjAAAVVSo/ypWTIGKuxqPOwJ7sf7RGDUofefj5vIMcnnn2rTJvIjSxP
	ovWa8i+ffORZPHjhzSQ4PVoOLJDfP8JmNMkL5gI=
X-Google-Smtp-Source: APXvYqxxzrnwybublt91RwbTrr0freHgdq3gDf0dvwyVluuC65c+PgKfs7spws5RDIsi2iw4D6Jli+/WEpLlKuu54gY=
X-Received: by 2002:a19:428f:: with SMTP id p137mr4439095lfa.149.1566786190163;
	Sun, 25 Aug 2019 19:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190822054429.19873-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190822054429.19873-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:22:59 -0400
Message-ID: <CADkTA4OUNp=QPi-cfE=OUa3-FK7YV=a+hQEVRp6o=z3bQoar7Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pyyaml: upgrade 3.11 -> 5.1.2
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
X-List-Received-Date: Mon, 26 Aug 2019 02:23:12 -0000
Content-Type: text/plain; charset="UTF-8"

merged

bruce

On Thu, Aug 22, 2019 at 1:45 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pyyaml_3.11.bb => python-pyyaml_5.1.2.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-devtools/python/{python-pyyaml_3.11.bb => python-pyyaml_5.1.2.bb} (81%)
>
> diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb b/recipes-devtools/python/python-pyyaml_5.1.2.bb
> similarity index 81%
> rename from recipes-devtools/python/python-pyyaml_3.11.bb
> rename to recipes-devtools/python/python-pyyaml_5.1.2.bb
> index ecb1719..711675b 100644
> --- a/recipes-devtools/python/python-pyyaml_3.11.bb
> +++ b/recipes-devtools/python/python-pyyaml_5.1.2.bb
> @@ -15,13 +15,13 @@ DESCRIPTION = "\
>    "
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
>
>  SRCNAME = "PyYAML"
>  SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
> -SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
> +SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
> +SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

