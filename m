Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21617.1794804226240449254
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 20:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q11Nvtde;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ecbdf5343so52915946d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804225; x=1795409025; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qt3yj/l7zKSdlKrx1CQmPruiIN0PDvcpAAdAxUifgKM=;
        b=Q11NvtdeGBovEinrGqjF8+6mbcyyqtZa+tORgwPsSKQLoAN7IY5DVRzcP54H7mWhOQ
         3HvNb/3Vz+i9PiSvbnQ88NkX9Z7RTtHNZg2cYsXufXxqg0PagWtbeIEFY6Vke8TCCCNE
         vXXUoeLti2IDFkG5LIkDWMCXXF4IFgJa77InakPK/Q4iOqRQBRnDf74uO6FC1dFesPL+
         NvgSX0IuK0fFiB7hB60U1IqcqrlsMe+fgSojyDoPgXMLmNnkmhQgtn1CosBESYYUydEs
         XKCtesuSUzkWwHbZ9OKU2lbE2AjF8y8abE0Q0aQ90NmhJRllM3TirDAdKjkDH1koVMrg
         Q+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804225; x=1795409025;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt3yj/l7zKSdlKrx1CQmPruiIN0PDvcpAAdAxUifgKM=;
        b=FdXEWucNpqW5SkvlVoIMn2C5/99nVR2aTb/1SL1PdCdYTiZZLwB9ytZUuRm/3P+IRb
         OeyERiiV6XbFiYCUjQnqQzDsvShnfP1mOqEeLFUx461uPTaHzd7+H/81wUbPLKQOSCMQ
         zqxluymYhuKtKLYyodNrLk40YNhC330Y5eibVo9nGnrG0YLgurg2dsiKA0sX+nZYNWj/
         NZnBfQhRF0WtB8iUZAcaGIOKwep9ZUCXgnslBu/7wJ4MV9Ecw+7QVZ8UyETSTE3/cQH8
         18GKQ0b+UN8fT8bMwMw3YCN7+Nj/nAK19wPJHmTKm0wsCe9MwnomjcxPK/o5SFN2PSk2
         a/Tg==
X-Forwarded-Encrypted: i=1; AL+hErHHlZIOYAIbYZNuVEQe4my5MO2otD7qS+dv1v+PslarcQ5D7GI17LmCa3yDBjqZiNR/cynu2g7xVLnGKDe0spIQU1dA@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z9vybFbS6UrNeJvG8MyCHphA5CR/1qOPrdngerVg6RmgJb4/zpw
	mSfENOsSPpUgplhPl7v17OJp9cH/klCMWkkiqy3/I0tlO04NYV7hk0ch
X-Gm-Gg: AYBFou2LecsJ3BI3tAaEigl7xjj6pMLi905aztFpSLGQg5CAkm9QizkYAY2MQwfO2SS
	9hdJLrSYsc4RyKiaFVz4JkFQEOsjQmTqHLPH6AsYlU+US6dpyfIWxLrCfaIPoN5B2GZmkYUNpk9
	knIp/JNDn7F9Sj69ZdETbJUJVgZaxIc3JRmKBOFpNKPUppsI1nQ6jXnktijnWbTWMcGKpUIQQJU
	Lu/lu1mmw5X10zcyMF5md+MaFr9vIXfKhCaptgRvn4K0NZW4UwHS5luvRSQq73lxT1H4kTa3C7b
	9NU55XtmJwnlzaMKLU/XMHzGZ9serqhxskK8H4wHvqjeOM0XjbqMxaMTcLdbJ3pfn4Hdp0DP7yx
	GnSotPyTP2KyP+oo+lQvbjTZPIVXjr/sNsC5NikybKXPtc13WiUMOVoTHjbzigGXKlWKT5qhokX
	YIfzIpKghat74CO20wF9IzPJSks8h7BD7pV6PQbccAypfpSiScgu6CIpK3fSWLh1ouQllEeMGwm
	qOaU3hez7puaCCaJ4S/bu+ZqjfLnkfkjYNMB+8Poku8R9DAPq4OPhTmkEeC77Y9iNKt0M8RAMIo
	XK6byjmJuQg+Khfn3ZioW2KKldBPRVKAu93MFTKggyXnjgXXscqxiQTi61BkVKDvXwowhB0H6UE
	TKjKKKu5eB42mtjIScyudgq/Lc2ed2RxDpEimcOspC7J2IyAmOmsVsPv9oZDcAXTHsP2uRrk=
X-Received: by 2002:ad4:5d6b:0:b0:91f:1294:17d3 with SMTP id 6a1803df08f44-91f139e4c34mr197859736d6.24.1794804224993;
        Sun, 15 Nov 2026 20:43:44 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920ee3ccf23sm7280406d6.7.2026.11.15.20.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:43:44 -0800 (PST)
Message-ID: <6afa8a00.cbce3cee.49824.e4ef@mx.google.com>
Date: Sun, 15 Nov 2026 20:43:44 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Cc: ievlogie@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] docker-moby: preserve gids during docker exec
In-Reply-To: <20261112090350.2918098-1-kshakir@qti.qualcomm.com>
References: <20261112090350.2918098-1-kshakir@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 04:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10171

On Thu, Nov 12, 2026 at 01:03, Kemal Rasim Sh wrote:
> Preserve and merge the original OCI additionalGids into the
> exec process specification so that groups assigned during
> container creation remain available to docker exec
> processes.

Thanks for the patches.

> +Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]

I'd like to see what upstream says about this before taking it, so
I'm going to wait for that PR to be reviewed.

For master, I'd rather pick it up with a SRCREV bump once it merges
than carry a patch. I'll decide on the stable branches after that.

You sent two different versions with the same subject, one for
master and one for wrynose, and a copy of each went to
openembedded-devel. When you send stable patches, put the branch in
the subject ([meta-virtualization][wrynose][PATCH]) and send them
here only, so it's clear which is which.

> (cherry picked from commit
> 5c36dadb2543835d79eb4d398cfc9da507f6ff882)

This hash has 41 characters, so it's worth checking.

Bruce
