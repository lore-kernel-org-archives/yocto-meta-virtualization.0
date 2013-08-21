Return-Path: <zishen.lim@linaro.org>
Received: from mail-qe0-f53.google.com (mail-qe0-f53.google.com
	[209.85.128.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D745E0043C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 16:22:42 -0700 (PDT)
Received: by mail-qe0-f53.google.com with SMTP id 1so686799qee.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 16:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=i2lGuUH1ehFjjs498+n2SMEnH1AuelmAz/bEJdXwPn0=;
	b=OteGTeMY0Rh0HoGKOE3aZqvI0qDY9gEj+HO/QnyKiar4Ra2alHpM/m+JVwk5kOboIz
	jBFFdsGVYq1jmadfFn84BfYAdTFqYCqn45MABiqjgRCPSoOArzR3FG2L9KDjVskG/1TL
	47IIFviakH/D4d5sVFKN89ZHwQYX8gG1enQyDHrqxNhrugcsM2IDXcD14Z6qx8lplG6V
	puwwpuUa3hXDuB0LmFjNLLG4K2wj10UeBk0TMiLhsVHGNrNVgfy2hQ9/5JHIcAJnIoMX
	XN/xdKlOEChSblAIMosxlvYFq6cPfNdCuu0W6nhXgEbNTS4Ld0BdzDtzlUBygGNEsNLr
	7Lvw==
X-Gm-Message-State: ALoCoQkVZtKrfQmXUvb2lm6GjhYhtRo7+IHdhJ75CewqzFzWTz8OjnNd7ogBpmA1mZGYTT/1qG/t
MIME-Version: 1.0
X-Received: by 10.229.112.194 with SMTP id x2mr1147780qcp.109.1377127361933;
	Wed, 21 Aug 2013 16:22:41 -0700 (PDT)
Received: by 10.49.59.82 with HTTP; Wed, 21 Aug 2013 16:22:41 -0700 (PDT)
Date: Wed, 21 Aug 2013 16:22:41 -0700
Message-ID: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
From: Zi Shen Lim <zishen.lim@linaro.org>
To: meta-virtualization@yoctoproject.org
Cc: Victor Kamensky <victor.kamensky@linaro.org>
Subject: error triggered by meta-virtualization
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Aug 2013 23:22:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

After adding meta-virtualization layer into bblayers.conf, I'm not
able to build packages.
Looks like the search path is broken [1].

As a quick workaround, I removed
meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
That resolved the issue.

Suggestions?

Thanks,
z

[1] http://pastebin.com/BmK4QnnE

