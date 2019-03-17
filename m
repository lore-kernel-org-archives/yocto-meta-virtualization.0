Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C52DE00D72; Sat, 16 Mar 2019 17:21:59 -0700 (PDT)
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
	*      [209.85.208.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF962E00AA9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:21:58 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id v10so10984289lji.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YG5X6a9wmZPnN8SY8iMF82CsqRi1Djl9tKag40Zq1Hs=;
	b=YTgRQQlpM98h1lJTXTw2dpShuiEoBWCdoo2Vgr7b2qzzkPspxi4L5K7c2ssGGoO8g+
	jugrHaqdzDncIpjnO18a2vqxliXDJI4iTeI8Y0nZeH6hJSeNwwYApN4Oq9a/0Sf3zPtL
	VoYW6TFtbgypWivyfjrxX2ACc8xERfcJvKcL1/zBrdCP6i/5N54FCHxscdDZ0WDIUWeE
	dMJqAIvfXVnmS5vSSjGXF6qf0Oh2b4MgiB21Wgfep3lmtIRAUZ0/XIFUMvzLK/sQYIAE
	wfiupDYpDxIDQUkOgsf/0+ZM8iI1yPkfcZJ9YlHulc9/mpcKDm4LBGgds+Xu7ONO7m7u
	WM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YG5X6a9wmZPnN8SY8iMF82CsqRi1Djl9tKag40Zq1Hs=;
	b=VSnYvyi+2tR+pOAoo/UPIa2LqClnafxUOZwhz9bDAGDMRUFmDBf7B4AiGPHX1q+DIY
	VNwOboE6pDeOkbxo5HJoTmn/Usv/kt0OlVfHGbQv8uH7cyEkxJQYgPZMMJDaWro4zDhV
	TMpHTtlFvNGuCogYeXI1TQFf5v22VDyzb4D3vIohAFecZ0HHVjDYRQlQv6VDQ5PS39iT
	w1xI+ScRmy2CFqG8LHfn8Xn1Euzcr5ttRoMkhOgOz4GKmCZOILOPcClQwGCvpqYH7bIc
	Mgwm84P0fErO/ocybNwhq5BYvTSDMTSCgFcr+7Nn2GsvjSZebWZ7eJCUnm/N+KvZJXrc
	8QIw==
X-Gm-Message-State: APjAAAWl0AvjLPrxEQ297jRRizuoQLs8yUfET7xI7FONEZZGhMs269Qc
	3/wih6eNMWbaIeqZC81Op4j90CLKBc4Ftp2CbTUE8w==
X-Google-Smtp-Source: APXvYqwBBPqeKweGLYXnSxdVRHl6PtoFQ0Bohr48iHnsIJgJIZkgo8UfMxEr5jBEisBxakc+0vq0MYdRrVWWC3r/Ba4=
X-Received: by 2002:a2e:9e57:: with SMTP id g23mr2616132ljk.124.1552782117595; 
	Sat, 16 Mar 2019 17:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:21:46 -0400
Message-ID: <CADkTA4Oyibjo=8nF3N_N-6Wf7V4hDir7A04Ng1s92EoAvm9umQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]: python-cliff: upgrade to 2.14.1
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
X-List-Received-Date: Sun, 17 Mar 2019 00:21:59 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Mar 12, 2019 at 5:04 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-cliff from 2.9.1 to 2.14.1.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-cliff_2.9.1.bb => python-cliff_2.14.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-cliff_2.9.1.bb => python-cliff_2.14.1.bb} (82%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> similarity index 82%
> rename from meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
> rename to meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> index e24c756..70ac4e6 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "2bb9bc906a0174afbc25f896484d215e"
> -SRC_URI[sha256sum] = "ab50fbb4717c74e32915123f4150805b463e81de1d58e43996fd813b26c5b447"
> +SRC_URI[md5sum] = "4c5d43d98970c79b091e25676cce2b10"
> +SRC_URI[sha256sum] = "b47387a344898ccb28ca7f386f017ade9eb66dc1713e5c642a0bc09ec606cc67"
>
>  inherit setuptools pypi
>
> --
> 2.20.1
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

