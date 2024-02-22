Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2388BC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:16:49 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.18418.1708622204779397743
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FGZAjMCR;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso661812866b.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708622203; x=1709227003; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXH14WsW43MlDRYRSzwuJ2HO6RHlGVUY3cEvUsOeOvY=;
        b=FGZAjMCRaz6SQd9HPTuPNxJoBfe+D2kIH5XLSDodrUYniP2yZeYWmZJ08QP6qIHUK3
         4X2cm4UOjBczT22SVjtttyFid9EJtaLzHfWFHDBDKhJF9oaAgu8c1zCSQ/+/yxjnySeV
         8GIQ4uexhU6/R5xuhgQukX42p/RYySdUCpXjq2ieo/+Vt87NiuaTWUqs09VAf14avAvr
         eTJXdMkT5NVaqnb3CqL0iTAb9Kxz+EAOnoqRXo+GbuqWXmZJ0g4ifi8vTSb/6kzlW1Kr
         T90ZaPVFedJlMkioF6+CN+yJ9qccQUFNN2yOU9qT4Vg8A6R42/Q31RzbgLA9iO658WZA
         8TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622203; x=1709227003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXH14WsW43MlDRYRSzwuJ2HO6RHlGVUY3cEvUsOeOvY=;
        b=CnkX4f5OK9/pQTvPPKPKFFR2X8xqQ9f+ysJ2Rr8PsfgTIguqodwSTcZi0ok1+BYUzN
         gw8FABr80QyF44HZgkxMGmG9E/7g7x41SN1wAR7F7uzw37JfXT8HTBkiWhL0cxfbMEYJ
         y0oriuslshr94qczH2L6+gO7T363QaKMYqQ+9WBEgfh+1DS/fJ5VAGyYT5qnZg7l2awF
         2GxjHxNshBRtZ1azxwuMNUX5yFEyB38MZ/dCZI4YbZwIBqLdSSikhV4WoK/A4fLtWP8U
         dF1PWMup1WDDzFdayq3bI6PWsixZSns5nQqVSOkxaqpNk5AxCxDeh7T6ASPkRuAaFm/1
         sRug==
X-Gm-Message-State: AOJu0Yxg/GJ5qf1TPg+nAPJp6wE0AQviG7Ff6NzmnrOD34tBo5C58gP/
	XlxFcyp4lExxwyjYaud44fUgvPTTFuZqch/MwjssudtnpSOXvK5w5vAWUNXuQ3FROPFnxF01M2j
	exZWXV0cuiO9MHMk1+9YSNPciOr1mwX+zYZvRdg==
X-Google-Smtp-Source: AGHT+IGYoX/rIcb5Co7WWxO1KjhIrmK9lMKOais/pA6nXm2n7opZ2uDaIc5mjhFUc2IBoB/OCZm5MNGzbhbVcrFnJe0=
X-Received: by 2002:a17:906:b848:b0:a3e:502f:b7d0 with SMTP id
 ga8-20020a170906b84800b00a3e502fb7d0mr9169167ejb.72.1708622203130; Thu, 22
 Feb 2024 09:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org> <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
In-Reply-To: <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 22 Feb 2024 18:16:31 +0100
Message-ID: <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8575

On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Unfortunately, no. I've already rejected similar patches in the past.
>
> The specific versioning is intentional and is going to stay. It tracks
> what is supported and tested in a given branch.
>
> If someone needs to deviate from what I'm marking as tested, they can
> carry a file in their layers.

That's unfortunate. Let's all carry a workaround for this one-liner
that hasn't changed in 4 years.

-  <project path="meta-virtualization" name="meta-virtualization"/>
+  <project path="meta-virtualization" name="meta-virtualization" >
+     <copyfile
src="recipes-kernel/linux/linux-yocto_6.6_virtualization.inc"
dest="meta-virtualization/recipes-kernel/linux/linux-yocto_%_virtualization.inc"
/>
+  </project>

