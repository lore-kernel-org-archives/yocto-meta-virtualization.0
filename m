Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3A5DE00D77; Fri, 18 Oct 2019 21:38:50 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04526E00874
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:49 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id y23so8134665lje.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zP0YcTLBeKpxUUGziDm/CwqX0UoLSzBXQcQXtEG1Vbk=;
	b=fB7wB0kZGA3pQq02Zg7FTFH7bm/bPERNmdmgbRFIyjokrRTJFiVqWaexUCUfoVht/u
	O2JXlWEmPUcGri24QAu3xB672BvMvfi2QN4BVXx9R609p1yh0mdCz9wp+EepTlfyH6RT
	tyz9eygM5kboQrIVxzxM+uQSaO3Jg1o1CADm+oyk6K34UjQ6nDK8i9GKygjYHfrx3wYN
	CcnBKcJQ+TIlSbcOFGqT1ToRuUVTHCSYlpEu+X79ubuKqBUyTLyJNE0QcYkVP7oxHEaQ
	zgb7IQiSYSPxyPrV0E8NGFH66f2egHDiB1yiNZh123adwHei0Tdr6BqbzSkWUhpeLrMQ
	zDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zP0YcTLBeKpxUUGziDm/CwqX0UoLSzBXQcQXtEG1Vbk=;
	b=putN376nw66vHT7lTCpplxy+OYe5d7M+rc+BUEFb8bqNCEK83d1IL2oLvcotefxhLw
	pvqilkWqgooY82E+KScRSVVvjwX5I5Badt2XRf7wgDn8dQyJ3tDxaZD3jgP5bSOk1mxN
	hiM2I8edsl7a0L9esjY9oJlRGjheLauV8/9Wj5IDEyBtKG8nf9MpYlbhx3oPx3WUWqM9
	/SgeMcbRmNsbVqwQaBPLgiWy7zoRyCQtCcGjt6/RzP9+7lkDGJqxKE5dSoZKjJQbYwjH
	6hjT3FzHGggeoGqs1ihXtBGPY/bj136srpQ7Amu3OjCxP2VQgTNuZgy6/8XbBTb1VFvy
	z3dw==
X-Gm-Message-State: APjAAAWpBoHcopFdIBIXsBUTw4/ECpJJdJ5T/S6djJp8u/U/RDgi52q/
	1F4D5qNHZX/aWVp6YnZi0fQWH/qFIUcEjgRX5ULPhtg8Yr4=
X-Google-Smtp-Source: APXvYqyxfG/9Yf6/WVsU+R1+619DuEhswzan4JLahzZVE7GzBoFg+5bZ4vYMonpM1ZsrK2UDhoG2ILdsQFbABiBy+5M=
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr8076417ljh.116.1571459928875; 
	Fri, 18 Oct 2019 21:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191018075354.7293-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191018075354.7293-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 19 Oct 2019 00:38:37 -0400
Message-ID: <CADkTA4O+DAYmz7u9JDCCyyeUOnZBErqCsazAiWqBxn6ctNrwwg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-enum-compat: upgrade 0.0.2 -> 0.0.3
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
X-List-Received-Date: Sat, 19 Oct 2019 04:38:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Oct 18, 2019 at 3:56 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-enum-compat.inc         | 4 ++--
>  .../{python-enum-compat_0.0.2.bb => python-enum-compat_0.0.3.bb}      | 0
>  .../{python3-enum-compat_0.0.2.bb => python3-enum-compat_0.0.3.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-enum-compat_0.0.2.bb => python-enum-compat_0.0.3.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-enum-compat_0.0.2.bb => python3-enum-compat_0.0.3.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> index d1f7648..9fa8c52 100644
> --- a/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> +++ b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> -SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
> -SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
> +SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
> +SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
>
>  inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
> rename to meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
> rename to meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
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

