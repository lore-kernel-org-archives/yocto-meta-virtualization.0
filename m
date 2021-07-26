Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.1134.1627325927645442326
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 11:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=EwtEw1M7;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=308; q=dns/txt; s=iport;
  t=1627325927; x=1628535527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y6nt0Vb5Yuhb3G7hZBAjfFdoqiONbfvphdGC4F9ogsg=;
  b=EwtEw1M7rpdFGdLnf0hoOhbi7inaAjbZdbMhNiwZw459dTw5+EdGSDX6
   uKnd4d2LjHwMkRcLr8pX/Di8IDOv09sfvdbGMmi6z94BlAc4yBKEW8Uz5
   vWu1Nf25KGCKLsu8t+WuQWhRmhETiBYHeowwDY3DTlSV2McloVpVHkLPS
   Q=;
X-IPAS-Result: =?us-ascii?q?A0BVAgDmBP9gl5xdJa1agmICg3c6lRYGjCyERYImigyBf?=
 =?us-ascii?q?AsBAQENAQFBBAEBhFiCfgIlNAkOAgQBAQEBAwIDAQEBAQUBAQUBAQECAQYEF?=
 =?us-ascii?q?AEBAQEBAQEBcoV1QAEQAYYpAUaBDYM1gmIlAag8giyBAYRohT+BOgGIfIUXH?=
 =?us-ascii?q?H2BEIR4hRGFLgSGUQeVH4tBnRCDMJ4mGiuDUQGjEbZ7hB0CBAYFAhaBYDmBW?=
 =?us-ascii?q?zMaCBsVgyVPGQ6OOI5WIWoCBgsBAQMJhDyGZAEB?=
IronPort-HdrOrdr: A9a23:Odfnd69yuJgFFs4F4oVuk+BjI+orL9Y04lQ7vn2ZhyY1TiX+rb
 HJoB17726StN91YhsdcL+7VZVoLUmxyXcx2/hzAV9NNDOWxFdAb7sSkLcL+lXbalLDH5dmpN
 ldmspFaOEYfGIK6foSuzPIaurIqePvmMuVbKXlvhVQpGdRBJ2IhD0JbzpzfHcZeOBuP+tJKL
 OsouRGuhu9cjAtYsygAH5tZZm4m/T70LznfD8bDFod5AOPlDOl76OSKWni4j4uFx1O3JY/+i
 z/nwb4/6WutOz+4hLQzGPI9f1t6avc4+oGKsyQq9Qfbg/hjQulf+1aKsW/gAw=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,270,1620691200"; 
   d="scan'208";a="753719929"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Jul 2021 18:58:34 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 16QIwYYY018186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 Jul 2021 18:58:34 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 7AB2CCC128E; Mon, 26 Jul 2021 11:58:33 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: python3: remove no longer needed bbappend
Date: Mon, 26 Jul 2021 11:58:22 -0700
Message-Id: <20210726185823.26402-1-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Transfer-Encoding: 8bit


Bruce, I am resending the v3 which completely removes the bbappend
when virtualization is found in DISTRO_FEATURES.  As you mentioned the
bbappend originates all the way from python2 days and is no longer
required. More importantly, it causes the breakage of python3-native
recipe.

Thanks,
Ruslan



