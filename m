Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.27.1626120109082687505
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Jul 2021 13:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PWn/tRx+;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id go30so9834073ejc.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Jul 2021 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/K/CWJY0Cn2meTqy0Vx7MZ0LEf77D2D15Gp6vtOe50=;
        b=PWn/tRx+H2/47QYvRBdZQV86QnL8DNJpXLQIOexwc7MGT+SRemrzFoquvCIHzrHctb
         G7vqOFpILE7youkKz9M/jXDH10BSj81k0hN4WliSq5sq5+YuH5DQDSfUZVMu1uk+HwJW
         U4EjMdlkxqihSK8aXQbS1oJcG/qXYhnP2HWtly8Mj8PaKxEKp8b5EStkRQiM8ayhmfGA
         YKOqxP04eXoW+HeyFhG6ZdJQEeJM3hO2tfAzEOioWM7N/A2KqTNRllWrf8y6LYS9IRma
         IArToY9C21+SuPGvyS6rH5DNEEwjwBAQI0a1/KtlyDEL90Y75/p4xMEAhTOMA2evQRev
         Suqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/K/CWJY0Cn2meTqy0Vx7MZ0LEf77D2D15Gp6vtOe50=;
        b=XTYXVTisQt1Y5jPYc4GRDHeXujZOXRK1awA93UFSDH3OFPnBzJarB3jTQlw+ju4p2m
         zjewMVYY9g1E6f4dg+v6lLyas85egxgxOc2CYtC/S1bZah2VTADy388uBrrxWalhhrp8
         1FNxlGRafT2RczQHUxjzpZYGknA0PqbH4cB5JarxDiLX8wqZ0z+UiVIV/ZPKInLgduAz
         aiE2CaaXoMCfVDwf3tyI6qJkwoJM2u+zhSWVS3XRwk9GseoGs0lq0jZINQBoYwMuJwqW
         cGQ13bp/nAi3tBNh+3TcHqICHmw/634NF+QZIYaaylWp2TDEKqkka2AUWPWI3V+mtEgG
         5B5w==
X-Gm-Message-State: AOAM5309mVwSTJBL6nmyF0DZpZwIbrolXYTpEq+JQKNIxC7tUdjsUTxJ
	t4NhJHdFC0NHWyNykQAy8h2lPmx6wYiikqQQfchKFeyFGX0qzQ==
X-Google-Smtp-Source: ABdhPJwO1H0EqJzm4Isyp731b7xzke125sPkIMIGHoP4aLMBGRHt6gg3ouwvMQR3b0NwR7lky/iwSnPCeCnMd4jgyf0=
X-Received: by 2002:a17:906:c7d6:: with SMTP id dc22mr842990ejb.517.1626120107592;
 Mon, 12 Jul 2021 13:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210705033942.29559-1-hongxu.jia@windriver.com>
In-Reply-To: <20210705033942.29559-1-hongxu.jia@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 12 Jul 2021 16:01:36 -0400
Message-ID: <CADkTA4MWVbbDsae6MS8j8gTsa=LR9JWS7PKWS7Kqfz8SOooQzA@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH]ebtables: wildcard bbappend
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sun, Jul 4, 2021 at 11:39 PM hongxu <hongxu.jia@windriver.com> wrote:
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../{ebtables_2.0.10-4.bbappend => ebtables_2.%.%.bbappend}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-support/ebtables/{ebtables_2.0.10-4.bbappend => ebtables_2.%.%.bbappend} (100%)
>
> diff --git a/meta-openstack/recipes-support/ebtables/ebtables_2.0.10-4.bbappend b/meta-openstack/recipes-support/ebtables/ebtables_2.%.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-support/ebtables/ebtables_2.0.10-4.bbappend
> rename to meta-openstack/recipes-support/ebtables/ebtables_2.%.%.bbappend
> --
> 2.27.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
