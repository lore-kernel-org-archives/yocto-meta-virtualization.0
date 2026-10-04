Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F49CA5FDD
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 01:35:11 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16617.1791077702281957958
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Oct 2026 18:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oWW0FDPG;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93caa7d3af4so74537185a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Oct 2026 18:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791077701; x=1791682501; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=oWW0FDPGk6qCvLl0NFidR3CHjiqPm3jGimPmM97+k/Ta5U+2WGXi+7RHbvO1e5iMa5
         uDjN4mgwM58mw+IBIgUEgu5UkvjZXl1BGAVLPsYgd45BDCepOc014beer8So5Dx/i1AC
         As1pVyKF/ZWDmGrk9PqzUFVERym4xH9G9J62+5iPqzhmZJPVhYhoRMtZ6IUj8H5qGpf6
         7N3n0vX7/wltjk1DSHMHPc6fYQB8tFcZg6m9MneKAzaeR/mbbiSKxsVbR2gKi2erO6Uw
         BVJwNcsz31lkvK36Aka/v0tmJ5nO0nFvU94Cqr//lD8JdoaxJtXnbdI4Dod7CHKE5izJ
         7Zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791077701; x=1791682501;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=T21YYwPi0aDNULPYhT3aoi3hHuFIZKFxU1NHBHjMBegy8i/IXINSF5yR7+8X9lNjzI
         dnstUahyUSOz/ob0458odegF3sfILttVPcvDPIShiimUo6YKX5M7G79yI8GuDBpT23oH
         D3BqOnTIpBSEoIZaihhlVNMleZOn5k4HLS3RCPfHQYh93b1/ce34lV5oMsK3mK9x42b6
         QZUoumf7yn9JeQB0dWxQlYSKcwZFRKgIINhepKUwRlBJCHtKluI8fn9qyvMmOkSOFKf1
         H6LTmbgJBGe74k8iOI0FlG1P7w2nzc+sV0UIchKciwFs6M9h0ufyAYLZksKl9XuGs/HH
         z0pQ==
X-Gm-Message-State: AFuF++mLeMn9EkdgRpJGLj8nS72TmHrPmrupeJSvpbeS/PTjYYef6Zfj
	8+wjpomOJUnoiW4lTFawAJH0cWqNhapwTPiBU7gDkrbJe7reqeZlJ6iT1iAhh5hE3HMFKw==
X-Gm-Gg: AYBFou31mk3YLusXbJ9mntctb8yM+tB53UWdaJeqSpws50Ow/S8dDsTTpKlHkxrjkN5
	p6dAlqPR2fO99jLKXam699/s8qy2ZiLQMwdwnzRR42E9t9v3DDc8d6as0UpUMRO4qluVvDMsDtD
	kPa5qju8lZlumlalRQkBh4gg29vR+bmSyL0DWlojB4LFyz8y5z4160Yq8fLoz4pPzwT2TsTuK4M
	AUyGQ7e888ZgBTbsLcKlspTQg8qMAtY0P69djrQUNmvxrSl8JwNlE/NqrYLqth1nbyBys0BmfVJ
	iGgD5uDc5UMCYzUOtfqfIr1vPP+PWpKmt9U7UgPONepSd0YJ0G7+9wDAutUmjpIzJnUEuN01a3C
	0QgusK4eB1H0Oi8KjlWvxaHMQop/5DtBzfhYGg+/l2ymPVjmliOqXi8r2Q4W1Vxf7BqYswtPfb5
	fR0BTBNyPvXLyuqSRDt1gKBCYRyZe1UCH6+6WSu6/Z6QF0uFc/zgvG2CBt59wSzyZoYg7YAb2ux
	8GE2rHAVibtEIE8EjKZOE9hR7QMTtDSLZORGNvTzaXXtFtZgJlJlzy8/hUgm6LSnfzYd7CSXvhN
	86H3dQgF8AB45Fq3FYc1lCEg3xNHYwM3urG1Nh39MPUwKPD3iglf85GJUz+c5CmClJUd4x2Vqpq
	PBvUlfA==
X-Received: by 2002:a05:620a:2626:b0:93c:6fa0:9813 with SMTP id af79cd13be357-93cf19d9244mr1277634685a.43.1791077701072;
        Sat, 03 Oct 2026 18:35:01 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2c96f4sm558295185a.43.2026.10.03.18.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 18:35:00 -0700 (PDT)
Message-ID: <6ac1ad44.dfd07d60.df4ad.ebc0@mx.google.com>
Date: Sat, 03 Oct 2026 18:35:00 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: aleksey.vasilenko@gmail.com
Subject: Re: [meta-virtualization][PATCH] containerd: add -modcacherw to
 GO_BUILD_FLAGS
In-Reply-To: <20261002110347.85140-1-aleksey.vasilenko@gmail.com>
References: <20261002110347.85140-1-aleksey.vasilenko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 01:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10104

merged

Bruce

