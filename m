Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.25617.1605002229406969012
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 01:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LciyW9CR;
 spf=softfail (domain: konsulko.com, ip: 198.145.29.25, mailfrom: paul.barker@konsulko.com)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C2FFC38C06E0
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 01:57:08 -0800 (PST)
Received: by mail-oi1-f194.google.com with SMTP id u127so13673574oib.6
        for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Je7JQWqiXeVLPAqMlbBTnGVLAhaDkibhIBrWXBmol+c=;
        b=LciyW9CRRdXhSUZH5AYlM0NyidG+XU2bFbBwUh6l2H/SAkl/ufDM7x0XNLWh21Oq6r
         CSWAEYTNeCwI4n4LFDrES3DbHQsiLf3IvZlGRYotGgq2V6IO1ELB1nMY9AsbwolFGEz0
         JUcfJWBjvGkxdKFhi5ceiVe+Wgf/dPFn1pLao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Je7JQWqiXeVLPAqMlbBTnGVLAhaDkibhIBrWXBmol+c=;
        b=HJeyAth5/aQ/eGFHhItSgD9H8A3cpeebysJJg7eK8R7P0qEYt1vW2NmMOU1jscdhW9
         SIz6YlxrTIQBmiAMrV7eoDo7U9jrPd7xqf9WMwyXlFGCJwGDvYcV9bIzCdCeQhQFlQdY
         zRJPf770H339cNOVZn/i0Bo3yI2XeO53onS8FwDA3cYeQ0fCcY6IgUCAB+Kda5tdLvNz
         GCCkBYNUytysLcLVYOLlyPjww6YVTHghxnbbcHdKW+r0z1daLOX+zx/WHT7SEdppXGU/
         hEWPZwxSwSxREwRpKbbPK4UYcdZQiKkFZvTOyVf1sVati5Xrjr1c7bVdJKj8ceOa/w/G
         oeEQ==
X-Gm-Message-State: AOAM531LQ5Q6/ACprd6jNCHH1AJTi+URQFXdFXUGsQsUbsQj2Dp5kXn+
	u4sfQjcGecswoe5vPnvFc8zo84ZzdwIWvgMLYkK2mw==
X-Google-Smtp-Source: ABdhPJx8+11txl/nPWwDNmuZtv/YAe+lJMt9b5AjD50fOrQGfeqHgh+Pd3PV5ZRN1QEi7NEopiBR0y1SIpqhNlm6n4Q=
X-Received: by 2002:aca:5505:: with SMTP id j5mr2078038oib.6.1605002227686;
 Tue, 10 Nov 2020 01:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20201110094641.11352-1-yanfei.xu@windriver.com>
In-Reply-To: <20201110094641.11352-1-yanfei.xu@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 10 Nov 2020 09:56:58 +0000
Message-ID: <CAM9ZRVskHmGkqJQu+WNechg3DiDS_ADCFTRYO=6mbhkmaG5o3w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ceph: add support for python3.9
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2020 at 09:46, Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> Add support for python3.9, or it will do_configure failed.
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  ...FindPython-add-support-for-python3.9.patch | 30 +++++++++++++++++++
>  recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
>
> diff --git a/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
> new file mode 100644
> index 0000000..096c9b7
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-FindPython-add-support-for-python3.9.patch
> @@ -0,0 +1,30 @@
> +From 27ac21526eae33a40edb81aef627aa13719fdaae Mon Sep 17 00:00:00 2001
> +From: Yanfei Xu <yanfei.xu@windriver.com>
> +Date: Tue, 10 Nov 2020 17:17:30 +0800
> +Subject: [PATCH] FindPython: add support for python3.9
> +
> +Python of oe-core has been upgraded to v3.9, add support for python3.9.
> +
> +Upstream-Status: Inappropriate [oe specific]

This doesn't sound very OE specific - surely upstream would want
Python 3.9 support as well?

-- 
Paul Barker
Konsulko Group
