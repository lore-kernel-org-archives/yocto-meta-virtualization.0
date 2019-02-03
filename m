Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39830E00D2C; Sat,  2 Feb 2019 19:43:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87EC7E00BAB
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:43:04 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id v5so7873441lfe.7
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=abNILCsF9xrJrBEw4EfPbHh5lxy1zCtMqOEIUFR60JU=;
	b=qVbZFYJnxA25jxuTzSyez1TCgc6H+xYzridPuLZLkcSyLwMfvMbwaCHl5UAopV8E9Q
	CoXLeX67x9ZH2KlfevdJhdgKgpD+Pyat5+ODmJsqyxMrJF5ckI4OKU3WwzciLRsUTY3k
	SmeJx45CE5MV9m1unj+ShLjZGgJ2t5LrpFoXDZWI2n2KMX6vVzzNUU1YjSWsWgFOwYrJ
	5nGqdFdI0H7gKacC6KB95wxqzywyFrAZuVN4L/nFDcdFHz8bELNMedY+SkHVOyo0hgLN
	mVjib23Ku3GKwMPGhL/8RKdymWWFbg+aYePZvu2uIyhMG4oKUAMVnKNzVCTEOj9rYtbb
	7y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=abNILCsF9xrJrBEw4EfPbHh5lxy1zCtMqOEIUFR60JU=;
	b=CmDmkZ0G4/6jq3c/XgCEKDYGWu9R4yL5JwuzX5XyQtGlRE+JqEc58SpsnaB6wxYA2d
	geUwLr52lwpxzTw5A+euvqF9B9fUmm2c8jOLST+T8RKkIFMetLAjaVSn+r+nl8kQjtp+
	UA6rqjgWZR70Z1aKikjQaHd7lbsbzYseMhtbAs3LSboUF13W9G9TWWL8utacCyAZdd4P
	qbOEw+wWFgomA7UjAvO9dRKQ0YEbgSK2DWcAYzODSxkYC0MzCZO9clLcJ5ef14ekNmRB
	+7aEekF5/vqAKgUpgBWwQG/LgPT6LO+VsCBpj2AwWoTgBzm5IyUAyavMH6fzYLeroFTg
	0TZg==
X-Gm-Message-State: AHQUAuYdA2P3x9GU2zZFAzO85BLLwC5Lu0rbrahlmsuOS7ZR5vo/DKrQ
	3WI+pCT//ZHXdHCXlN7EW8CEO3G1XZXf0x8AGkE=
X-Google-Smtp-Source: AHgI3IakI4XNofb1J3EH0g58i61WUW6fM1/B0SCmz592MTjv2Udt2T3aiHwy40G+aU4RtKYO+wxe6uWzkg9CYdA7pbE=
X-Received: by 2002:ac2:4243:: with SMTP id m3mr16703745lfl.5.1549165383382;
	Sat, 02 Feb 2019 19:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:42:52 -0500
Message-ID: <CADkTA4PcGZEKkaj1cO=RugSA1RTXsNj1Sa1sWzE+NqHzGM9cng@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-mox3
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
X-List-Received-Date: Sun, 03 Feb 2019 03:43:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jan 29, 2019 at 7:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Fix HOMEPAGE
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
> index 73de2b3..c420bc2 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "mox3: mock object framework for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/mox3/0.9.0"
> +HOMEPAGE = "https://pypi.python.org/pypi/mox3"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> --
> 2.17.2
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

