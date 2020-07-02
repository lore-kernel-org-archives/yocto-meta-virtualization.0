Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.10084.1593706180149964906
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 09:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fUR3ADfD;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id e15so24581907edr.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jul 2020 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQL/IaWmNACjocTRccgwtnNc0EstucWfkA0T4sROdNw=;
        b=fUR3ADfDVFHWmdrpmrcScSZffPSKA8QU7Kja7jw5pv13Y83nLAnbP+UmoSQNCid6pG
         MsEXYP8ViuPz9InJeGeySaz+lttqWYD0iWHC5Z0Ils+FdxYSJZeZM17zG1ZNDILO+2y/
         28MXpyLGGmxpe0SagkeuEBv66eLDrVdzWpEuFqG3Wk2bEKhlEAnM/vCjy94ips5wmczB
         4SmrjdbIfOJS+CRFT6d5tC7Q5yzUFfqzkSXZWp8LVLRe2tXPY+1qVHQ68VdLsLUg4MNv
         JejnOqEc42sVg2pTxux1CjXCexk7Mbhb23wNb/am+Qj3EYJOXb1RhQYJnlPuMZAoWXj+
         ojdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQL/IaWmNACjocTRccgwtnNc0EstucWfkA0T4sROdNw=;
        b=LwgdvDk3vGoOqH2Mt5R70TCHtMaJy+VtpOA0IWR/Lui5XlcUxGFbkKwqKXYvfSoPDK
         bMo2DlOLEvP4dUHsU5nj8a9N3xnC0tHJWc82US1zjkSJY1Q6bbwzeitQ7d2xUNeJIlx+
         4+dQ+D/sGIEm9AIZPd68qbbwQ/0zE/6BAvFZ4WeVMooqwj9Wlk0BuB49LE20mdSFB/rk
         k0/gBS7y05QgXUzJwXyE4b7XuuKNM4ux4Qg/p9tMJNT9DGQ/xd3wbPjMLaP8dMf/Q3yr
         1xCcx3ZqdwrVeY2clk7526MeH6L9xyTxgBO8yRtBo9Iar0hybxLEQIxFvy0uP6Fyhmxg
         mDAg==
X-Gm-Message-State: AOAM5331M00wahY+sCjI8pg88ZQXg5TBwq4lfJSJF5wttIiguGfXqoSc
	z6EFuf1d7wUzVxOXTCN9a/NqCPIiF29K7azF0ZQ=
X-Google-Smtp-Source: ABdhPJz/Baij2jAWWwTMrf4rrKLcpenGOMwt8vMPKDvF+FZDqtTPODN4iVCEFbUrrQVsW0UeJ/4jMfBPN9z1h8tPNSw=
X-Received: by 2002:aa7:c2cf:: with SMTP id m15mr11128849edp.27.1593706178741;
 Thu, 02 Jul 2020 09:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200702153907.75805-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200702153907.75805-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 12:09:27 -0400
Message-ID: <CADkTA4PpjKV2wZ4ih2D7ycPbuPwN5Ps0HFCheoMNgP4Hb0B7=Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] docker-ce: remove unused docker-registry.service file
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Martin Jansa <martin.jansa@lge.com>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jul 2, 2020 at 11:39 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> From: Martin Jansa <martin.jansa@lge.com>
>
> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> ---
>  .../docker/docker-ce/docker-registry.service  | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 recipes-containers/docker/docker-ce/docker-registry.service
>
> diff --git a/recipes-containers/docker/docker-ce/docker-registry.service b/recipes-containers/docker/docker-ce/docker-registry.service
> deleted file mode 100644
> index 7b4bc46..0000000
> --- a/recipes-containers/docker/docker-ce/docker-registry.service
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -[Unit]
> -Description=docker private registry service
> -After=docker.service
> -
> -[Service]
> -ExecStartPre=-/usr/bin/docker kill registry
> -ExecStartPre=-/usr/bin/docker rm registry
> -ExecStart=/usr/bin/docker run --name registry -v /mirror/registry:/tmp/ -p 5000:5000 \
> -                          -e "STANDALONE=true" \
> -                          -e "MIRROR_SOURCE=https://registry-1.docker.io" \
> -                          -e "MIRROR_SOURCE_INDEX=https://index.docker.io" \
> -                          -e "SETTINGS_FLAVOR=local" \
> -                          registry
> -ExecStop=-/usr/bin/docker stop registry
> -Restart=always
> -RestartSec=10s
> -
> -[Install]
> -WantedBy=multi-user.target
> --
> 2.25.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
