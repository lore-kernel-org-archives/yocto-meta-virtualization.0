Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web12.166.1587499535793574616
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 13:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwcp2I4h;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id q204so13082146oia.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2020 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ASC9g8oHAyvUHU75y0Z6hxFJeQFNjj/2TKb2Ix3XEs=;
        b=qwcp2I4hXta2w3hF3Y7wYAX0nsrJqypuIOspcxchv2sSak6WPhEvWLnKWnXZXQLT/f
         TW6TSiC/GPw49IggdZZTwrYSO6P8l5ZBt5ov62wTQqF1B8CQgbyCabd1agwbPaf4+eZ4
         Wubg9CFrDeUk+1eaj59oeFqSr0ebXNunp1NFguDMxmmSSllCDXRvZ4q5NOO8iaT1pbe/
         BtRSrMc/KCWWPaFjt5j9gWThqHplEFj2D3VamIo5apvke840QbkN5Y/dlfXMzuJvP3Rk
         AAZZBXPGDic8OhMOjFzO2suUbQK2D3Ta1JdQqkH3F3nOe3GXzHugrWjyBjbim5GircG6
         E3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ASC9g8oHAyvUHU75y0Z6hxFJeQFNjj/2TKb2Ix3XEs=;
        b=BmsuXU56h+KRH3gdlDlCRCS2Vo9UizNqIpyTdcifySXo/2C462U656SyiUyUt6ETO0
         NLuCAL/XvYVStATQ5gIvwuOx+ArYhv1rn6rBEwg2a1M3T4F88SwkWmBleMqdzGDHntf2
         tpWl2SS9WHE8qdYXg9yzTBh8H9LEj8VCSISLDut7WCf/evxN/s2Lk/dhrd52nNSgKNkD
         Jb0zk11LF9LmsbqdKSf33CJWnoejuBAxRPjgo7Clf46IvGPn+jW7HuAEF6bqDW6DaDpR
         Kr2I+lPj/xihQzJaMinu9xEXdiT/0vehxK11vq4Q78aS7QmPWjt96h7PJiNGHRarnl97
         d7dQ==
X-Gm-Message-State: AGi0Pubr7FiAw3ekOWoq+W4IjyNBiOayv5HPM7kjghzlysZbJa74J76H
	+lRIf3KAH5fJwircqi1ovuyZ/pTNCW1cMTrYoiY=
X-Google-Smtp-Source: APiQypLAswO+iZH4SpfgqDQGS2DBAFIn1hbYcze3T5KfrN2FfpgZBdH+fg0Dxb1+/aOmQcSuK/phEpXnnwJ2C1/a2uE=
X-Received: by 2002:aca:af17:: with SMTP id y23mr4619768oie.28.1587499534995;
 Tue, 21 Apr 2020 13:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200420171739.12379-1-jpuhlman@mvista.com>
In-Reply-To: <20200420171739.12379-1-jpuhlman@mvista.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 21 Apr 2020 13:05:23 -0700
Message-ID: <CACMJ4GY-dbw0H-Wd-3YioZS9WL7piQT24zKdi0hpoEqsH1HeGQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master,dunfell][PATCH] xen-hypervisor: Check for the right image in uncompressed deploy
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 10:17 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Corey Minyard <cminyard@mvista.com>
>
> The deploy for the uncompressed image was checking if a .gz file exists,
> it should instead check for a straight xen file.

Thanks, this looks like a valid correction.

>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

> ---
>  recipes-extended/xen/xen-hypervisor.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 21d9c7f..c386917 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -47,7 +47,7 @@ do_install() {
>  do_deploy() {
>      install -d ${DEPLOYDIR}
>
> -    if [ -f ${B}/xen/xen.gz ]; then
> +    if [ -f ${B}/xen/xen ]; then
>          install -m 0644 ${B}/xen/xen ${DEPLOYDIR}/xen-${MACHINE}
>      fi
>
> --
> 2.20.1
>
> 
