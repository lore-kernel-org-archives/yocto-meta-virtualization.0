Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 219E2E00B92; Tue,  9 Oct 2018 20:24:13 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7011BE0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 20:24:12 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id p1-v6so3495889ljg.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Oct 2018 20:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gyt+TyJKmS7pHDjREYU0+G4aiYgjgoZYOFi9N+Kx3Wk=;
	b=a8C3r/S/3OhCL40leeLxJhw+JzboOKKMH84/0KqCOghR86pK5yX0AxVRm+j1x/5CVX
	iKv/TaQbPRlmbzArBBpWoAEvNkEmB+1WodXuOBIpOdyFeQvkgAGccGjCIaf5eeXC35j7
	+SnKg5YNJazC6wxAjpVgbcNSA+HhdRePQWT59XKKkiyCgDZz6mCbNIIXdGQwd2oItip9
	Bkq9axddQc0Vjcj6G/Ic1hqT/myjoyVCzfT+MDcbG+H5Wss9HPanHyL4cR5JKdCZl5ub
	t6Rvhnlw/k99zX3GJaD5B0GAnAbulV3Vc1vD3iF7ATG/0XStFPXFWVWFNmyOBWGnqgJF
	ekRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gyt+TyJKmS7pHDjREYU0+G4aiYgjgoZYOFi9N+Kx3Wk=;
	b=qpt4L9c/yXNvtVxE+2oBbH1cjwlo5DUV+j64kUs+pSVmEjaCfB6Qw1EX9cabIkfUlK
	fl/7aU+UpzrZwMD2649om2TnXsCLaLYfA0P90k0Sy1pzG5GiEeTwbMd2yFCcwsYF7yzS
	8sMr3M+aDQJ5FxJsilGTS/+3zFiJheVY90nWy3YASid3xF0EWAphqTzmF/0lU+YWrSPY
	frr33TdKXDIQK9vn88Ks2mXy52C+auhopySjjQcNItIhmiuKhIbG/ZTP9D1FAtEBM164
	cff1lMHjf4400socgNi6Dbt36ulZK1pn1wm2PCx4UQMqEBujEwp0cnQVMqfpf65/uC8m
	nrWA==
X-Gm-Message-State: ABuFfohKzHdAbtwErLIm07NRkpc+D6hzfyYNlxERqI6lHJuoZacajWi5
	g0EmQ3AN9CaZxUigCYSe89EOLgUFnpNCAt/CV7TL6Q==
X-Google-Smtp-Source: ACcGV62IZvXr41YW6iSeYzYRYP0/uFM6lxdWdRggtIHg/8s0QwgxeN+oiBBU6B9F6Olh1lLZbAWWLn3948fdmzJEo00=
X-Received: by 2002:a2e:5109:: with SMTP id
	f9-v6mr19298670ljb.155.1539141851274; 
	Tue, 09 Oct 2018 20:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Oct 2018 23:24:00 -0400
Message-ID: <CADkTA4MrtQDwm8S0P+NF+RNyZmTdihV8-WiTUnZcY-z8cMQXjA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/3] conf/layer.conf: add `core' to LAYERDEPENDS
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
X-List-Received-Date: Wed, 10 Oct 2018 03:24:13 -0000
Content-Type: text/plain; charset="UTF-8"

all three patches are now merged.

Bruce
On Sun, Oct 7, 2018 at 10:58 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 18b0feb..1a53886 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,3 +8,4 @@ BBFILE_COLLECTIONS += "cloud-services-layer"
>  BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_cloud-services-layer = "5"
>  LAYERSERIES_COMPAT_cloud-services-layer = "sumo thud"
> +LAYERDEPENDS_cloud-services-layer = "core"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

