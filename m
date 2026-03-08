Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6543DEA8540
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 18:58:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45972.1772996278527832235
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 11:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aO77AUVd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=X5RdF+JX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628HjCW72390489
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 8 Mar 2026 18:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=47pxkUcBr4Eqi/rp1sf9Ucqa5unuzhShXmfSgDoUs+c=; b=aO
	77AUVdP+ZV+uGPalQVvdiLs4AutbbZ4u2bTYmDXeballacqrHcwHosAmhFBLmXDc
	o9wHieLAJeNYMDXKv3puVcSN9qWjm2v8uPebjrXECtvNJzIAucW57wMkglH4GQil
	j9DlSLLXomMAmOMmO3plfO7cqaNk63MmJJBjd0JJ7BXnby8cshRy8GpMkuLSyFZ+
	gfEACWkxXj08hVTFRu4ukAEfg5guA9oV+XWcDSJ5RA6i6JdDjyzISjOWj4yg7GLk
	gMleBEJlGOhR401tkd64Db6hACY0EZKi4ynbmd+XhgTAOemg1mkZyRpNw1SFE46V
	5ap0o0D2jxBjo3dUUf4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxu0y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Mar 2026 18:57:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae5031c6b1so64416355ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Mar 2026 11:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772996276; cv=none;
        d=google.com; s=arc-20240605;
        b=cy/Yrp4+SMTtEN038PdT0Wn37Wa3ath1ARGdaF91lIN87+0XrtO15q8or6FVFerZGL
         pNa6JZ6dFl0tQWuDopWcekgBibSbX+eIoUch4tWeOH2iWxdaGadtkof7SM9yCSzgz+lD
         6MFf8xe5erseuiEAFuSLM341b6+mXvvg93ngVlDTFCBypIAVujEPqQ5L/1VRAN8AjKiR
         3TUeGOPksAUcFD32BEfkmbY9J1iSfxOfwx3iAl4UOQHE+e5vn8Y5vJUItQYkbfCAkLCS
         97kyr29vBbE/2hq03aJDR1+z4Yd3GnrvibiVWx05k/ATzIb2C4VUgQL3PUdEa58geRrp
         CcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47pxkUcBr4Eqi/rp1sf9Ucqa5unuzhShXmfSgDoUs+c=;
        fh=5fTbruxPLz/QlVicqiJVVVh3hqcckKUUFhEPt7uy2kM=;
        b=eVcMZXka68COWXdTC1yNURrTQ4+PqkQ5R5iLkRF1ojYKfX+OhKhEAl9W9kpqSpSnZP
         /AyeTjTiO2/Raw9lCFkVgOk4S48hx5tEJhZ8I50mXg7/VlPeu7X0Km6eqPnbGV6vLt+1
         GqUoyCXbVOh1eFfnBkHPGtDgygOiVqOmgsIgdmQp+3WpUAHZIllWA3ze0a8jk+sTNCA2
         eiOXscOXdE32XNtlZdiclCS8yqAHOtMlsWbGkkQPjToZmyw1eoczd4CSlyutkaa09XaR
         /xs81U6NRXPHVvYdqHkNXcBNuuhGXpLR69+vrItGoFZJcsMFKjvHmrwWKkEJuF5Q+BV0
         RDLA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772996276; x=1773601076; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47pxkUcBr4Eqi/rp1sf9Ucqa5unuzhShXmfSgDoUs+c=;
        b=X5RdF+JXqPtWwLJFfSzdGldC5VvikogDvfnTcnZ8HETIiRnHw/0KeFBwaE3yrG8zIM
         Qzx1qKmX5A8u977ey0o6iAQDvc7mOT1vWEJqJDN60Ek45ouDwMLSpQzmGpB4NWhi9+TJ
         pT1cGBEpUJ8hXUQmdF+7GRifj0lcD7izaCmBVUH+Rwc287/2zDop5jfT+b1ciKqXFd2r
         3fMnetpYTqPXnKnsyyfRbv+1cJ9gz7udxNCPWjjvVIIhAWzLL7Vd4nr+g6eKIg7F71gk
         Huw3VUKxnQC0U7XCITOMqsRpXgT3iAC4zg/ZUTfptTxw0DJfEwUwz3tY+BOUJ3uKwX+w
         UkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996276; x=1773601076;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47pxkUcBr4Eqi/rp1sf9Ucqa5unuzhShXmfSgDoUs+c=;
        b=uoVszswq7hZsNy7CuUsTPcHPH6HnDsRr6oWxHFzm15z15w8AyfR/PuMRK+sQfvwCcR
         gkFEJLSdueMa/02PuRIsk5ejdyNYofiw/c2r8OzXLoxf/4DoESYSRwPafb4MmrMXb7DH
         5w852Bki0W9Eqk4MEGHqePxzpBE6dW7uP+ej2MQCQ5gVMsu/0bX3bW0K9veS/pX6Yc/P
         Inlzmpz3Wyqyt/u/dIsY58MrffSZhiQMw9Mk9FYutMQvmgfDDTK3rzx19D9Wvw/0LVCz
         5g6hxD2toNKd2EhHk388UPcXSJVNJV3K3bViOVcKkZlX2AL8YB0QTUVuLzY6fvGXkHW8
         4oJw==
X-Gm-Message-State: AOJu0Yx4iUkZt8QQnjOAyr8LdAJkC2w2NPzB3gh/ZtJQucUHHIPc1vpb
	0PLnUyLd7b/YhJqjJjnJwXgswfxZ5nGevTp1ZFnJKCaKRUypcrDvP4FuNDRGRC1IIyis3Byfnxn
	Z88/SeWqNA5XeaHQs0zJInYAcq3l4o65uNLk8JDYK5oSzJ958hDONy5sKV0yXe9GqMpytThc6qn
	d1vdWap5lm8gs88fWx9rMStPxhSq7VAzyXo8DWPY3j3EPjCagQVV6jIAkuSmFIqOFN0rRg88A=
X-Gm-Gg: ATEYQzz3rnwzuzHKcSpusu12lnXAeqP3oPC65ZhEwAuNwEwdkL0govktKG79lt6x4bW
	4ygAF7bTbGTHYapbz/0dSX0O3USgu0CQXNZZPl4SPtvE6z2YTrO2VrvLaUMGlqcCRyL9qnCSmfe
	ivemhIj8yrYTJ6aHEKjqyX+PvQmObGWkGGIs5+uPR+0Huvotebezs8bxGF8CaBBVei2ejuv20De
	QYa66P1
X-Received: by 2002:a05:6a21:7a8c:b0:392:e81f:6711 with SMTP id adf61e73a8af0-39858fb37f9mr7694331637.8.1772996275792;
        Sun, 08 Mar 2026 11:57:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8c:b0:392:e81f:6711 with SMTP id
 adf61e73a8af0-39858fb37f9mr7694303637.8.1772996274757; Sun, 08 Mar 2026
 11:57:54 -0700 (PDT)
MIME-Version: 1.0
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 15:57:18 -0300
X-Gm-Features: AaiRm53o9qtE1JVrxuVkHP9U9n9hBe6UfmX3yZqYY9xXu_jNqru_P3xPab-YbZw
Message-ID: <CAA_5yosWgnNzyVw0QJ=cAsaOG-1-mc6T3=jE+82G9WO7wD2v6Q@mail.gmail.com>
Subject: GO_MOD_FETCH_MODE vcs broken due invalid tags
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE3NSBTYWx0ZWRfX14s/V1FxILyq
 qytmBiM9LvHGLhr1MTlzBdBZDctnDm1ZQ4PnRA2vhhnp7d6aGRFSwcRPzxmAsfwn3/wMfObX8LF
 jxXOp8/3ztYii0ZPmyzQEQRYlVQ8vAuLfo8K80l2s54e1iAtRrgdTdQIuAlZwlG7Hnc7CzKGcXC
 wSEYwXidAP+f5fWFBljLEsMyH+3wI+6MDkOxB0pfsLSixDdRAf2Wh4799fA4FC7xIz+m6hf3ixa
 xk9JvoaPdHE46ocvp9B195fMi3L3UpUH+qrcSrHjMbYfHolpHEepxbEQtBYLNfhcmBmmIQvbHc/
 qXuT/mrI3b6AAbuUE9zG1IhsREVB/imTKOOXYkKZ7pJRG0cAH9G0jRbb+PAMUn+rb2PkFtT4Whx
 t/lGvyyqCKMVd+cvDxO1c5CBzOaOJrRaKgnudNJVYjhwUI+Bl3yaBgfrPPzk8IaiL8u9xbKl/f3
 +1tMzAK73KUhd1rP8wg==
X-Proofpoint-ORIG-GUID: fQLH-3xp6SjA69auWuiuNZtgqyVkmSPr
X-Proofpoint-GUID: fQLH-3xp6SjA69auWuiuNZtgqyVkmSPr
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69adc6b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=iGHA9ds3AAAA:8 a=Oh2cFVv5AAAA:8
 a=ttz7FF-SDpNH9lGBmCcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080175
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Mar 2026 18:58:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9625

Hi,

I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs
today and it fails to build due duplicated entries pointing to the
same tag but with different commit revisions (failed on fetch). This
seems to be caused by
https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=dbf720ccb0519a4dbf143dbaed1633527b8d7b60
and you can see the problematic diff done as part of
https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/docker-compose?id=56a7b72a93fd20d9c21ecdc45487a888b76d194c:

+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=33540a1f603772f9d4b761f416f5c10dade23e96;name=git_da0444fc_1;destsuffix=vcs_cache/74df1e05ff5bf1317fe42883ce7a496c0ad3800044d955163fd3f3acca0a0166"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=git_da0444fc_2;destsuffix=vcs_cache/144d2f77c6aa06af51d5820df4e7506c5ecad01c86e770e0027b682ff0d3f9a9"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=git_da0444fc_3;destsuffix=vcs_cache/61395547cb668a679b4d7508a904d02fd50ffe1630e5ffd6f4ef293a97c2d3ba"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=59db8d763f22395595c26ee1cae0886b57141b3a;name=git_da0444fc_4;destsuffix=vcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405fca7403da460f8d25bfb69091bc0c5"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=git_da0444fc_5;destsuffix=vcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea1eb55451adbc71dbed3a8871ed8e13"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=665e8c7367d1ecf644cea2d163019ef59c13d554;name=git_da0444fc_6;destsuffix=vcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee910ef3822e04963ba444b3d04db399"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=git_da0444fc_7;destsuffix=vcs_cache/2b23297aec08f23623501029a20a4eee604e87ce090001ef6ad0a5930d799dd5"

They are all pointing to the v0.3.0 tag, but all using different git
revisions, which will cause fetcher to fail. I tried to have a quick
look into the go mod fetcher but wasn't able to quickly identify a fix
there.

Example of the failure:

ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:
FetchError("The revision the git tag 'v0.3.0' resolved to didn't match
the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs
03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)",
'git://go.googlesource.com/term;protocol=https;nobranch=1;tag=v0.3.0;shallow=1;rev=03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=git_2e975dd2_0;destsuffix=vcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621e2f4c38e90360ea')
ERROR: Logfile of failure stored in:
/home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linux/docker-compose/v5.0.0/temp/log.do_unpack.7110
ERROR: Task (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta-virtualization/recipes-containers/docker-compose/docker-compose_git.bb:do_unpack)
failed with exit code '1'

Other recipes probably have similar issues.

Thanks,

Ricardo

