Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83A7AE00E00; Thu, 29 Aug 2019 21:19:40 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC1CAE00D89
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:39 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id e24so5110291ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7i8lj7VE7Vn43Wec0Aw7vGNs9R8CLA/rteI2MaHHa1I=;
	b=guHhgQDeD+8vnj02daAq01zljSqif+TjEnwKaVszYGLZ5rE1wKoo7MproxZL6OCVoM
	ODoc+hs9OKDLlmK4B5dRGYCaBnCpAki/48whcpkj53UYWGYSbSV8x+N7KAfKCYx8xUhI
	m5vupqS07M5bsFOBuhyaUquLalgj6FWSLOIaEzhK95/teM/Z3xiAF230zYY9evjoildG
	UfBOC9xSUXwKUZHJXLBFUAPH3PJLAeV5JsgnOLHJ5sGSC3mvwHXyL50HJP8gun8f/l6c
	RzvX8zL8TRN+i7m5zYsxQHtPUTqW5dP1CcB5r9Ox6fDmrNxiQgelSBE4/Wjlc0cBxWXv
	VYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7i8lj7VE7Vn43Wec0Aw7vGNs9R8CLA/rteI2MaHHa1I=;
	b=N/xaiyAh9NwWEFvVBq111a2Mzt9QnGiydfFylcPssr4fvyiJxjeGxugcgu/Yzj4EsA
	2Ca7gqnytzfqishy2nEMvZt2j/iEhd990CRwTdF0NXH7NzzznfvFZRG3AOan2fQjzVZD
	HBR6wzT4rqVChh944HnF8FNk7GIH7OjRH8uZ486LHGAcsacPqlw5+1CJIMOU/oRCOSsg
	fGAn0hOYxz6cVpYqEbQUz7nU6k/2xN4qOvrnWmfjMx/YwCI3pIm1JYQXWMz5C1jESQQo
	1glGUuDHCRO56h/SkoWK15j6GNo1S5uVBxBf2LJx7gDpARA0dvFJrHGoyy1IKblACE4D
	goLg==
X-Gm-Message-State: APjAAAVcHhvObdPoyHbbpCmdTqatdfPCP6c5U8+gNxrWSIU4yDNPz3Kx
	SfZBB6rXGMvG2kw+4OVDwPzWJAIYkOwTTWhtYpQnYjA9
X-Google-Smtp-Source: APXvYqwEBu8r80sR/Fk2GpMU6Zf16yJiB8qzApMbEoxUw9qzme/QUpdUYD/6+mPAvDZL5ISUH8kkNc6jviJmuNnN5/4=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr7137449ljo.87.1567138778735; 
	Thu, 29 Aug 2019 21:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190826071858.1543-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190826071858.1543-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:19:28 -0400
Message-ID: <CADkTA4NJ-LkVAktL3xpCpKRtbF63FNv=0Jf1a_pG=U3P5H+4fA@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-eventlet: upgrade 0.25.0 -> 0.25.1
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
X-List-Received-Date: Fri, 30 Aug 2019 04:19:40 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 3:19 AM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../{python-eventlet_0.25.0.bb => python-eventlet_0.25.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-eventlet_0.25.0.bb => python-eventlet_0.25.1.bb} (63%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> similarity index 63%
> rename from meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
> rename to meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> index c3eabb2..d2878b6 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.25.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.25.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
>
> -SRC_URI[md5sum] = "a7e8759e6684352ea81a157b6f93fb9b"
> -SRC_URI[sha256sum] = "f0610bd0d3bb3d51d69f74caa4ad04fc7bce424cdb72e54d08ccda90d8c69800"
> +SRC_URI[md5sum] = "8d7145af6506d5418c5a6bee7bf0b7e7"
> +SRC_URI[sha256sum] = "6c9c625af48424c4680d89314dbe45a76cc990cf002489f9469ff214b044ffc1"
>
>  inherit setuptools pypi
> --
> 2.17.1
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

