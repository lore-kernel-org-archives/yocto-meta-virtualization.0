Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.8325.1618835709631393496
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 05:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WWseaxA6;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id sd23so43999160ejb.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Apr 2021 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=flp9sPMNjvwdpm7F9L43zbp3K/x1JeBzssRjr+UckFo=;
        b=WWseaxA6OZDNpDLaV194Pf5kNYMHtBR4XQLvMWj3S6WHAg5/4OGwGV4/wzSUHsa5/u
         Dlad0TB61yrCOYT4PWwG30owcB7oU1LY1rxb0RaDPj9alh87z0Df8i0uD5nvugd7AwIl
         BgAruReCdmG7OU3+8P/PtJsA1SAYMcPk3qO9P+jXSVdLOdC/LPlMdERi4Mx15/iRRarY
         WBv88OHjOm72rxe/hdUvIuxGi5M2Oihi5nK3Ipo2Iaavh6nOO2MQwIFcYAf6ZYs4VzYS
         xKEeeb0Ht/FjT5+9SFVXlXFvsL6hb15wEeQrwoE8GuykHIGIlkG+tc2dhUI7D6nIC5eZ
         kMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=flp9sPMNjvwdpm7F9L43zbp3K/x1JeBzssRjr+UckFo=;
        b=ma26gWBpqwnZtuQm733qCMTbDDrr1Dt34I9i/aKpt50YyQMeV1dopxqLmJ75WuKHie
         /4hGzM2I+ZAo1GJSo+T4bfS1vVmN5Z44OHveAs4Chz0qZv2IHgfHrKD0GdYvoUlylTxv
         IsRc7GyA+v6Dyx6o3IQv7xFRDQMNWTpSgrwQVZwGBxgx4lyP71WhEzAeNIV692CIjGg1
         AiD6QRaVFqCpE4Fx4ZivzQ3NER5N/KUZh+o456NdT58Fuiv2PVkzYWb55yG09VLtkmK+
         poeGcOGRdIM+MLopwTAVsSulJYkKl8eWEMnkOQkVXIVTS1zwMKLb06q1w0/N0qy+hAgX
         vUAg==
X-Gm-Message-State: AOAM533baiM4niv2plLsbQk09sna7i07i2DSUzUoV6SI4kyOeTzace22
	b/lKwGHhaKp5WR1qrgBz0uwyA8BNzazRoj8X+a0=
X-Google-Smtp-Source: ABdhPJzwHQaoGnkyvCi+LuF3B8irtgn7A3BLB0LtLFTViZKgBN1X3etta4N54ONLlYTGCWUPaYZIVrlVhQsTVMhz6Sk=
X-Received: by 2002:a17:906:f210:: with SMTP id gt16mr21749740ejb.22.1618835708111;
 Mon, 19 Apr 2021 05:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210419001236.GA61503@gmail.com> <4875.1618826656055737799@lists.yoctoproject.org>
In-Reply-To: <4875.1618826656055737799@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 19 Apr 2021 08:34:57 -0400
Message-ID: <CADkTA4OxyFEBHKhps60M5_vOYAaz+6R=Qda-_9CjfjmN83Ha3g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 1/2] busybox: Add nsenter for podman runtime
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 6:04 AM Nathan Dunne <Nathan.Dunne@arm.com> wrote:
>
> Hi Bruce,
>
> Could these two patches for podman also be backported to Hardknott please?
>

they should be there, I cherry picked them last night.

... but now that I go look, I see I didn't push them.

All good now.

Bruce

> Thanks,
> Nathan
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
