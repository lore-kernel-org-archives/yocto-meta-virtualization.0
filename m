Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.42])
 by mx.groups.io with SMTP id smtpd.web11.9309.1603095142316091704
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 01:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jwiFatIG;
 spf=pass (domain: windriver.com, ip: 40.107.68.42, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nATnQo3S9xBH+QFAGZc3l8TBYC31Q74Z089b+C8R3JOFfVlsSyCd1OnY7qNSQ7LBR7CZGBXY4HPtwOC9yZwYIWe+pm2l2/EwN7m1iuk3qiY1glwEE/7FL5S4Hib1YkvX7N2KXB/3HOfjwFQcZOxIIHcCeRbTHcuIrQDWaEziHcNNh1NAEQmmpEXlTELTaTpWJa8ZCxtIzS70rta5u8y2Z6Ol3dMO+U7pFq0YOQ0GgLT1s5DdVIhW6F0mdBvB/i8NvTE9d8mMJ++IeLeej2MbpF7zV65Vcq5YygJNFwodgCppeeaOTXQH0422t4SUlck2X+IszGvuvbx0Nvj12r+BSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaOKEoQtvU3h6/IM8jouUHvB++k5++YIDNSjeCHBjAE=;
 b=Xx8yUiMHpvUNAZRm3o6bTKlWo7madJq5EOUuQG5XfBfCoRbO7m1PDZSKr9Q60lJlWTZIYtsawMJBFAczIrdx1dawd1LPmuA11trX7Zyncdm5yA3Vqr8hSM1phb35tW5CW+j9Fs54nsr6oKmp93Di3IgA2Fdt7ZUb+QCOJq5ymBtS4vcoHvPSypWSo66sZk182Tz5tE8lczC9TavRQvs/YV5meYyUyfn7/J57vK0EJ2BBi0JL2/5dmvLdtKl+VcZnBvjWxIx9j1cMKhyu0YUsknkKqq4FF5niF4wjiSwSxptEemGlJehGhpjtPAzYjIQx2Ns83dBlgcBWI/4Ud9PipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaOKEoQtvU3h6/IM8jouUHvB++k5++YIDNSjeCHBjAE=;
 b=jwiFatIGHly+aUuAbJOcIg48OPQXriAV7cTrmvg1QdCLGcCimrbEOJBUoRHdWxauwvKjn4fH480fOdS5IuWaBm/Iot54LVLVJRNKxMq4YAxNkuVUMlXHtCp+I6PegUBqROfVZlYAdrPNK3argwzKu9dgbGBkgraMzCsbyYZ3jNM=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 08:12:20 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 08:12:20 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][m-c-s][PATCH] glusterfs: use /run instead of /var/run in systemd service file
Date: Mon, 19 Oct 2020 16:12:06 +0800
Message-Id: <20201019081206.10239-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:203:b0::30) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0114.apcprd03.prod.outlook.com (2603:1096:203:b0::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 08:12:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258b463c-bb36-4268-00f7-08d87406b38b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB418426705EF7E2F1539DE47FED1E0@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZYtoCYj7dpF1H6m+TpeREA4ntKjkNkril+bKsMZUFA5VN2Vni+AYP9BRBXbOWtOQG7BSzD6QAmNfBB1jL9TP0pwSDxJfBdlCh/445437WagGSpaXDG/8Ke0vdrkuz5v9+Gz6pwoGsQGS9FkhM7bci7HY61HWkSc2jZ3HUZXU96MlI57NA/JLENSRlORZZq0RF6Eo2j7pcRuhUdi0ldwXCWMOInhmJU130kWGZ60nsDX+1jhBCFOB1CXXX+RQ/nAXfbTXLCGEfKk28cObM3rlfKsumueTVii87HAqaisApAjT43WhLPRrlycgvelgVswOYpiE4RqMdTmarDGFa6tg8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39840400004)(136003)(346002)(52116002)(8936002)(6506007)(8676002)(16526019)(6486002)(2906002)(6916009)(956004)(66556008)(66476007)(66946007)(86362001)(186003)(1076003)(26005)(4744005)(5660300002)(83380400001)(6512007)(316002)(36756003)(2616005)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	io+qK/49XVnXWVFQdTCp+tMful70fkhn38sPpjbdbSw04/BF70SCBtEOqjmrY1cgT7TllPybvhKTNYUMxNFf0BRDsAr1sT68erDVYKD+rNkUANdGLpeJULsCr5d4Q5ETaaEfeosKe6QM9asFcnhulH9A6uPCSej9sJ3aJz6WqSYxzdoIEE+OA55fS32AzkLS69VHNQAsPcdizoRU20dpJl7kmdWNej4ls8vbD5nrEpGsiZEyqOQkTlH6yWeg9H1O/anPc/CnqeWAyGvYhXd/E0cYb0lnlyxyrgLOCirIaMV5qpnDM0hluBkMaQetwEqqgaWgospapflHLT9xicXm+C7VONN0z4XBR568yMIx7By5B/QyCg8wIM1joep/LckGQCOabmc7+2HglxUkJTg8yjS6fMHo+jP2CKfxz1sEXE+mLAS3zqjl8xfPzQxJRl8GGDqR4OGhHdoOXKqVKKEA9V7GZhLbxsDKNpCHSF3XZ78BFw31upyzYzADhrVHeRn1ZAN2qVbx+wpSwV6ZDwLp2XgUwP+v4b0YDIUZwdSeOfZ+IqPcP+kIT5hAvb4CQASinA63jUfXVMLW47RmFUAynoITmr3F1AaD/4l08kK9Dsg4tbqUdKShtf6Q/b4MVvpDgzZCI33iDAcRHVcqeLHt8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258b463c-bb36-4268-00f7-08d87406b38b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 08:12:20.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laI/QO5iyxdlYeEA6Ne/RjR15iW/BN7F1YyGU43PBvoyKpufNN7tVBltXDTK+JMsL5sVSdlDhj3MSOtqgodfrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/glusterfs/files/glusterd.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/glusterfs/files/glusterd.service b/recipes-extended/glusterfs/files/glusterd.service
index 4835c820..2219f582 100644
--- a/recipes-extended/glusterfs/files/glusterd.service
+++ b/recipes-extended/glusterfs/files/glusterd.service
@@ -4,9 +4,9 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=@localstatedir@/run/glusterd.pid
+PIDFile=/run/glusterd.pid
 ExecStartPre=@base_bindir@/mkdir -p @localstatedir@/log/glusterfs
-ExecStart=@SBINDIR@/glusterd -p @localstatedir@/run/glusterd.pid
+ExecStart=@SBINDIR@/glusterd -p /run/glusterd.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.17.1

