Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.926.1793898035003290269
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 09:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Due+4hGL;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eabf243d05so821907e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 09:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898034; x=1794502834; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Due+4hGLfSKSX0RcllzCUao5a6iyuYvowEwU28OvhV/IV0kCGyKIeejUV/FV+at2rV
         CqOXr+ujJ83Ddx4Sd6Spd4PgLxSzvHO1/4GO/ncr/OLKv2dZqZGgaCUzg4QXYjYjIGv8
         adHU+6Ss+e++tNjfdoUIuigyWyc2vNz+8IwFBUHakrP1k7MqABfp9grdPuCgqhvpMw8b
         mqMbvKsZvR2YqwbuQR36jlcrLNbjcqd60EMBWrD2RrV6MLpx88h+UWjmh2+5rbhR+2vL
         O3I/dtQ7xY+ZPnpIoWlJgLlGDzAffXyQfGKfB9I1wgyXcZo8vHhIOzR91J/yg096tvbj
         dJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898034; x=1794502834;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=vtg2rahRcXrnMeF3UouvdkRAuMynV8AEacL15j7lAX72bALI2rSDxk/OVnPEzTgiF2
         XPK/kuX+Ixxx+LUxfBQzFkHTfdDldu2jKOT3slT/lS5cpGIyI/gYxXlOUvuKyqjS7FYU
         pE0uGAIbetwcF0JODStrIAdLdZVLaKhafznmAeM1sgj3WJFmXYNOQKSDtWKMF2A71iY0
         Er3DsExuXDrKUDYVesGbNmB4EOrE6c2hBIeUKvDAf4abKQND076FT9uZkZmKNkrp/auW
         u6xawXUgHWIewhYtqqL1oJh6vUswa3Yn6/NUGdojbBQIUhENKmTL/1WjuZzl80q673zX
         Jn1w==
X-Gm-Message-State: APuU4Z8/oH6l/uetEOgTFqHA9cQqA+mttqjCF9dff2gY7/Kwgb9P54J/
	awRsNiAGcuSwapyDCXvRs+8IukJpearHGOjBoZpxkuuN6cWWgh7hcouZ
X-Gm-Gg: AYBFou3ktSqBvP/B8/Si4pA6lrX9nG5B+LPO5uARl0UkGYLz5bEHo0ocSMnsjoX/diW
	4dS6/HYa7Dpbw7xDs/sdh3AWyQ3aFslYX8Jfwrg7EwexKMmAy6LlbNVU69ChDcQ4bSw5QC0C7X6
	lwBI8aG0dpzR68cYq4oxpHntV5XTSmXZBwDZhObkLgZiSdhFa4y7NZKznZX0jFy3PoZR4ECLY2V
	5uDE3NOSQ8rylfTUSOCvVX8ePqdD2QxjerNIBbzTuyCKo7ZzklQPyvcbBkkTDa38DYMXQ8Be3TY
	o8vXp/n8JZ300D0FJax/BgFbhURPnTRDxdANfaDFVQOCxAufouBzt6MzVvgzF9mRF1lfVeTHaci
	s7DMWGOify7bFypWyADNmDqezemx3CYZGszHPczgd6Kgf6FgwC53G6jakQ9s/qVmxL644/5Yjon
	yF3gBG7O6XevM5l1FLtpFFNeh3SVjErQEvqqYkdHFRWKzAW+O7LuEcgFXuv1dtD5q3Y+EFAxqRM
	fHjm2a04V9VEikvn66nPvyeEZMERQ4XflVsiMTr8MK8pAu0vxUxqSyjtrcDsUt3rwaWfxoBfDDb
	WLbALqQdxJvaJvexT/gTbzk3ZYfFqY8chLKKQyWH8Ganw34AvomwpSThZ+va7e1c/pJQi54tPHj
	F+vHR9CIt/zXjKYVaj71Vet9SufPi2XUxoDpTxDPODKcm7UbNY6Xdb3Iw+rBYQIrq9lhymemSKD
	k=
X-Received: by 2002:a05:6102:f11:b0:7d2:8cb8:dbea with SMTP id ada2fe7eead31-7d2a16a52d7mr107782137.36.1793898033605;
        Thu, 05 Nov 2026 09:00:33 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d28a073cbesm2267859137.4.2026.11.05.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:00:33 -0800 (PST)
Message-ID: <6aecb631.012e078a.11cdcc.9119@mx.google.com>
Date: Thu, 05 Nov 2026 09:00:33 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 1/5] docker-moby: Fix CVE-2026-34040
In-Reply-To: <20261105060006.1286469-1-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 17:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10156

merged

Bruce
