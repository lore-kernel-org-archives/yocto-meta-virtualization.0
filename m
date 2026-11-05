Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.335.1793896673054398849
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 08:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UHwVfAQD;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6dde81a6820so1336803eaf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 08:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896672; x=1794501472; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMicTMBihdwjrCpGaSJ864qKSxUrTHEsbSl8Y+4Ow1w=;
        b=UHwVfAQDdS6Wk5Fk8jD4Nd/FB45rT/OI6VQqkt4VIXzakqAaOftKyEOAUvUts3ejwa
         fEYArBAuxlgBFHmkZQc3Pc1dLVsGJCbSLxn585LtWmIBbo4nlS+cQXQEeGzssRF0udwf
         JMTqwYIxKG/AQaBmL4ZCu++J+WQzz5ZbYl78zIrVKtRWerJVT/q+HYqB5ByzSh1xNgS4
         mjtLXYEgrdPM0+b5OI/4uqW/tkqAnfSLQg/80nuTt+wXtJlK+abjwDsQALhHDFKpGR8U
         vc3Dvem+vdDfqxKHgbMbJGpmHBEUd1ovqLSC5h2fAuoaYfv+yE1N4PuqUgKPPvFSSny5
         eVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896672; x=1794501472;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMicTMBihdwjrCpGaSJ864qKSxUrTHEsbSl8Y+4Ow1w=;
        b=y9eMUijLSd804kzkzZtajrG8Bfdb4EzayJ0S959al9AwngvVLpJLzuuzJL7jClhGHJ
         qxpTgh6oeKVQGO10t76o1rRFj+lk7ffLRPhBxzPa3AztlNJAYEXS/TkinND0jIi/XsRa
         IaMSNuSFr3jRAo5bICnYLwSjulbho2FpQqKp2bvTV0YQsy1pW2Y3U7OkVodHm6UHtRXB
         wpRzoFtq6PQS52bYf0aRv6QM0T+SIrxwI08a0jUswgqI4tJehZ4lj7vOIW2rncxpWwxC
         BUnYBq9p3KEGTG2ocbBroHZsfB4PEQFbt1qaZ43w/ANdC0/efF+Rf+z2Q4Y4dBdzyMvp
         rxlQ==
X-Gm-Message-State: APuU4Z+7uFDfKTvHuHOOWI3LtmtR34PVwKzVs8mqOwGw077DqOna9r8p
	s4xy5ayvoUTM2Grf1SMfeWEhSQkHDPfgcohnXVv6rg2EKQNlUY5HeVMB
X-Gm-Gg: AYBFou1nMLWFTEU/5xPUoTIhVmJglbXPUx6F0Cj3yjOkwQaOxrXUJiE//yHhciObmmB
	3ArdwKp6PyjlJfExp0y3q4o39iRJEpJE+J+lad4y4jJLqnwH/3mU5TU/XxEKOZEc46CNy7G4dNX
	YnRPcR/yCUL8TkzPsf1EHL0lXBgRq1/anhytKxDg3dlO/HnnT5CEZXgIbSOKIK21XhyFP6g/Gk4
	3XxdN0z63jQ9//+yKB0gSJn7Xn4CKcbhJsEtuQPfhZW4QRZftEQFG4LpWChKWbKWWH8OIJunQD4
	bJME9PHmZmc/Rgcxd8HhVM6IzsEidCEs9Gjt6XA20NbuFr7UGNlU06L09hw5dLxeadloRYeo4Xa
	j2hojjiHoHtc7DVgQivpnjbkjtKKA/KLXfEjdwVRiQTWAE0iTDH1Av4Jw7vTCAFF04Vr1yhnyvU
	NJM3WBoRydQYHByQQ/YCBTKxn8m7wcxxsoy3RXtyBZVbt2l5Aw56PUT7QMij0zUaqrVF849VNw2
	It9bQTTywCK/An4EBOTTV3JqZOJFuNBvyXzq8wcAfd4UyRrMjaeV9OlveQ6OLYSVJC6GGN++NZK
	ByFwgMDrkmAiwCbrgWtd4usjt1VoCPQHJDjxMiDri1WuyCqu6zZQfqjUT73t73hS6UYFURt2hFF
	qsWqh5qjiHzNVNLZgrKq0rgQUSHdlo5dxIwBtZv5/XabNiStgnQRB
X-Received: by 2002:a05:6820:83cd:10b0:70d:d3a7:24bd with SMTP id 006d021491bc7-716e79123eemr25155eaf.49.1793896671857;
        Thu, 05 Nov 2026 08:37:51 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12b7d84sm4438855eaf.7.2026.11.05.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6aecb0df.9e649e5a.29d0fd.a42e@mx.google.com>
Date: Thu, 05 Nov 2026 08:37:51 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 1/2] containerd: Fix CVE-2026-95837
In-Reply-To: <20261105060354.1290580-1-deeratho@cisco.com>
References: <20261105060354.1290580-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 16:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10154

Rather than taking the partial backports, I've bumped wrynose to
containerd v2.2.10. It has both of these fixes, and the ones we were
already carrying as patches. If you have any issues with the version
bump, let me know.

In the future, if there's a bugfix release on the stable line with the
fixes and it meets the stable policy, you can send that bump instead of
patches.

Also, 1/2 has a bad hunk count as sent. The header says 231 lines but
the mail has 232, so git am drops the closing brace of the new test
and the patch fails at do_patch. It looks like it was edited after it
was generated, so that's worth checking on your side.

Bruce
