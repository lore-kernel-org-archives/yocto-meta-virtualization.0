Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097C3FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:47:04 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11121.1777376820023101605
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eet9A+Oh;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb40149037so1156303985a.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376819; x=1777981619; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwaQBGZNvUJmwrQiQTD6JiP4qbjqRSM/3ln8OVE/rgk=;
        b=eet9A+Oh4sZOe5GTsIc0dZDRU58uuOicsG7EJzbxRrMuYA/rVzGeJI6qX39ozTVvEl
         vGcKaM+4ZcXnChKlnnDACmFf3LZIaYepHszfJYjTylXx6yRrV6gjooSpORXTqLS161C7
         048vCPth+N36g0kI6Da+JZPBQ0MDwvbUUezir/MuPqgUDhnqDnJVFpzXfomg72FGA2Ci
         g5O/n3wCnopnaqc49XiXYaIP1oyqypvdI2zmhh96iNr4AdY96/Ku43Zm3/Nr5mKKxkLV
         Lo8ZXDFKCNDywGAph9NBg9eWprwjlFz0V3sV8I3xzxjNOus3YBohdo/0NSOLI2/MSm+n
         q5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376819; x=1777981619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwaQBGZNvUJmwrQiQTD6JiP4qbjqRSM/3ln8OVE/rgk=;
        b=ZSa2IGE9UdQfPuQh5xTOr6FnG7+OmkO1u3R6csS1ujoIKks6o0hqkZRIOiJfOhs/tV
         kPMW/Ifp1G8mvXwRRfkQboaGPYv1MSsI361uFrpUqgLcxHTE605qjd+mu/F/iMceZJHH
         6cXoZzpiAAeu5CRMvZNoxVwb960jWRgJPolk0JVi928+8p6D8GjgElTsheBegNu4AHXO
         zjI0WkAIsx2kNfWn5uzkYfKsplnE/Qv7U7Wg3UqOUtplryU4X+FfMSyyIU63+RhVdVQQ
         ZdV49aUgpnCnzHIz+Wmpa+1sYFfwJ0PLcWmXvsgm6AIH9SV6cENfHRpwxDxJTtV1+1uu
         5icg==
X-Gm-Message-State: AOJu0YzgMVmZmPS8Cfct+X6KCry8vlJVUzgVlnqBw01P2AheTLYXAaa3
	HDfwvItqaAYZRBLXRAb1sfmH4baPsRFf+TQYPLJtySWV+84ttDaGZcloaqMvQ5qNudBslA==
X-Gm-Gg: AeBDietpWHe4E6hVU2HUFMlBZ9UoO0O1UqiHNpxRHp8qORUhLhtl7HmwetDYiaMI8Vr
	ouvX4DrES0OJ4oP4JPKcbt+kmsnw3v1aYqb0fPM7zm4LRqsqMQMjaSab7x/K6x7rt+J9Ujfauo0
	13t3WEq8WBeCAmJ6+3TCxrePlYRew/cpxH+lCSnfSTKPbHpGG2OgBe+O6jVlq8zME3qKsfUnypP
	vPoN4vxXZCK9MJAewZv4WxJ20tLJ88ED1kyj8goMbScfrvLunUST6hVJI6EWs7/wSeE/ft3WndG
	uP8ubzYHWcbUHqOSXSN9gSSDo+nAur9K/VH6J0gs+rBOemT4EUq1wOQ/epVSFopsaiqKs/FHOPs
	n5e7u946k+QRSzkO8hfQevHz4Mx6wRmuL9OcmgmHAKeOCu18yZrQLbBNYwC5M4p59BdmqmaNYZn
	XPz7m954EzJyi3edRJgUycjTzBE0Jvqgxqr2HulfJgbX06LHhy3oIc8dsMD+VCu4VMN2pSXlFxK
	I2qkEXcnGIl1o7Xadr/4ufKHg6jCtjr9i5LdY/mrhqAjFOTg3Tw+32mmw==
X-Received: by 2002:a05:620a:29d4:b0:8f0:5793:ea7a with SMTP id af79cd13be357-8f7d8f0ec50mr355569685a.33.1777376818818;
        Tue, 28 Apr 2026 04:46:58 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7cd95fesm172064285a.27.2026.04.28.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:46:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:46:56 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kris.Gavvala@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: delete extraneous
 PACKAGECONFIG[systemd] line
Message-ID: <afCeMLdDVYBek9c8@gmail.com>
References: <20260427204856.86829-1-kris.gavvala@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427204856.86829-1-kris.gavvala@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:47:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9766

In message: [meta-virtualization][PATCH] lxc: delete extraneous PACKAGECONFIG[systemd] line
on 27/04/2026 Gavvala, Kris via lists.yoctoproject.org wrote:

> The PACKAGECONFIG[systemd] variable is assigned twice, with the second assignment overriding the first.
> This patch removes the unused assignment to avoid confusion.
> 
> The duplication was introduced in an August 25, 2022 patch:
> 	05f316f7 lxc: update to 5.x and meson

Ha! I messed that up some time ago :)

Thanks for the fix, it is merged to master

Bruce

> 
> Verfied that the build did not change after this deletion by checking the log files before and after
> and finding the same message:
> 
> 	export systemd_system_unitdir="/usr/lib/systemd/system"
> 	export systemd_unitdir="/usr/lib/systemd"
> 	export systemd_user_unitdir="/usr/lib/systemd/user"
> 
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index f08d793d..3de9a8e9 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -80,7 +80,6 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
> -PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
>  PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
>  
>  # required by python3 to run setup.py
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9747): https://lists.yoctoproject.org/g/meta-virtualization/message/9747
> Mute This Topic: https://lists.yoctoproject.org/mt/119038529/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


