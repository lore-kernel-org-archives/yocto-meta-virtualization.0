Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40.1793895978450158439
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 08:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DRzKpAWT;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8439fe796ebso1196405a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895977; x=1794500777; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=DRzKpAWT7spsmB/pobaOXmOEPGPLXIpwpSCK5JADf9wbfngWeZDgTstnhzi1Haa8bP
         iNyT6R1VdosviloSTCvhvmOGf1YoliwhPIG7py7ssFz6JQ4WStbSEU/Ih5xqtAFzhyJV
         kkPABOkLOm1FfknK1qQQ2BOmQZ4QWkQnNEJU8V5SLqsIS2TulOCM0xn480yejBjFkUqY
         LApIGsbx4X7M5DDi+meKkpJeVgk9hBZ6hWXMBJfvIVnGFncfIoBVdJn/zNv175815GiD
         x2pHdy6BLBFgNlTgj7RpXrjwhIDBnc1Ecf1ca/kp+BKfza7DZWyKUbGWkNl+L/aTvXIt
         7ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895977; x=1794500777;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=vv6FayMnoOzAFmKDGSsT0R2V2SvtFtBXF+KbTWO6rXqhqCsetgqV4U22o0plTsoDLk
         XzgVdUr32kDcTF2xYvKcqtdBGndzLgcDnRoob0JvxKEpfSYY5L/XK7D1G5Md2I5YLBnH
         POl9SviorpqI/5VDve8ILJYwXLHp6nVepI/PhN46kK/wbRSp8O3PrA5qTPamprT6FBBV
         Nxv24UWznA+X/8bA85chKrlJcj7G6PY9v1Vfbls7yJNKvtWZIYAGXiOnYX7vnuqfUz6O
         IcnqZfB1vSF6OJW+vzysvIR/78FpO2YX6+cLX7PI8B26EUSPlm2VDu09398beZEElo63
         7hlQ==
X-Gm-Message-State: APuU4Z8KVSmE9HgaWkLNQZujmS5NGnrNXjjBFqo5VPD/HYTbreidm6N3
	JYrmFcWQFM0ODohHq1UnDWN5rWKwaGB6iS7jXT7QGkPEEV720TNVe/HWTqp92Iqp
X-Gm-Gg: AYBFou3h0WetQ3jSynrYZ/oYursrw2yHi41dmRV+txLkU+8iY2x8qNuL8MGb6EWr36W
	b3yTkS9yOV1G+hoiBZ3l8QS5usrDViCeFnxtBaMJ6vMda7xvRmMfzaggv/d6g6ralqZNsO7bkwP
	+9+UbrgTxyXfECIoU1mAY2hErZRX5OIw0sIXs1vpuAQfDiNIJDMCGPY8+Vxx7fkuQ1r1fP/uuJd
	rJd6ENi+RxvuYhmsyB2rHDLi6hwbZuGwon7blsHVc07cNRleXaBPLMiQ9oIHhSLCj/ZKta2w05c
	jxY5OrJYDmanWfqVk7DpaXQLAPGkhJz2lu0ArZCy3Fm1c0/2ZjqKhf+dNmcc1JJK85QfDAVB8J6
	LTUzIV6iXYImU9STG9lQuDp70kXqIjhMZOnpPz1Ylq2g7bai7BFsUBdsJ+ZZL3DttO/YMoCxzQu
	2DE+3SmJdXMMumpwaDVydTycMfIUuGiOa+tfdWBfkJwGxatT7t4GAQNSVjRNDxd0MxJJ/wMU9o8
	MaHl08W5TyiG09SrmKy7aJMJLtey5G7M+lLKi5K/7mJpotIEI1sTxFvN4+y3J0+33ua4M5t5w1L
	dtTtYg8iZX2pTCvN3zY8/vj6SCaDsTVFJvIDMH06aZw+PphfwHIbol4n3pSC0HOSZvCIJ5dlkDt
	WgdiFq8y4foFWac5Pd0+IBXH2pPv5IAumbjpe7YoWzWsU5gQY4xhj
X-Received: by 2002:a05:6808:10c5:b0:4f1:7cd5:8e0b with SMTP id 5614622812f47-5640dcb5ea3mr15133708b6e.22.1793895977229;
        Thu, 05 Nov 2026 08:26:17 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f400fasm4622552b6e.8.2026.11.05.08.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:26:15 -0800 (PST)
Message-ID: <6aecae27.a96d76c3.73922.1557@mx.google.com>
Date: Thu, 05 Nov 2026 08:26:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [meta-virtualization][PATCH] Add a b4 configuration
In-Reply-To: <20261027105606.1973102-1-thomas.perrot@bootlin.com>
References: <20261027105606.1973102-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 16:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10152

merged

Bruce
