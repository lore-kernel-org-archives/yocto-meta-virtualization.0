Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F89C6FA8E
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 02:38:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13165.1677638332290217422
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 18:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=242464cc29=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3212TgwM020632
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 18:38:51 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrbefk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 18:38:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npfgDvd8+MzPfUOkYCv9pxa2tbG5+7IhleObWWH2psPdHxMmlOGTyvuu4I1EuGiKh4CXS92qnb9rf4JKtEbc8c3/d7nWq/BABZY8U25N1akTr3zNIUaLOsf9B+2hxXd3mnTatp+oT1RIEat72r7Xy/i0bYHVBZGKDhbCNlFahoPf6Zit4EHLGD2rXLixL4EvQGJvK0YUHUx2U5J1NJeLY/46GvOjVLaHF/KbWGhmDpa4eMNeuOugpPwLi7ogmgAT7VIgHn1+xdESYdSQ4w9TljXYb+z60sx3BFtDORjGByGA9no+NZs5SkXoEWYOwNipYiplat/f8cbSRx55E8YOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5npX5Xc5pGoy25yF893mZLkdxCxF+94gSuvg4DHj2QA=;
 b=LaUbJ1Nl3Flo1Vxauu22YbiTpAoSzljWtJnTZFFv27DWw0kxB5IdypkiUBzWaUvNRohrLPouHuhabYP7bYQmFU+vUM9dKtM+TQ0pCTBMh8EE76tpYmCOhXUsUo0DBqHQGE57j1HSQV0JGgQXvnUu+kmLxL6VzaUon8iGgHLKZWfVXkydDFQ0a1y+dpX6dqdAiNjVIDk3CQ9DnBCM6lq0lnKkMQc+0a1TfawmJfPnMX3AE0DUjlwSYhcpqfogiz6I0SqwffQitKHXQZZ5w286hNABmu7x120lSKLfXfVag1ZYTQ7RpSaPWtJWOJMSk98x1iSKnyZmiPU3d7jthxJAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 02:38:49 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6134.025; Wed, 1 Mar 2023
 02:38:49 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in: if busybox contains init then use it
Date: Wed,  1 Mar 2023 10:38:24 +0800
Message-Id: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 19538bdb-5901-4c1b-e4fb-08db19fe161a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ofInWyjcm2SuDbNIe9kO9RznESdYY6EnYQFzn7cNTCyR4DiSaDJys46H34GrgjpMOhf1YTixAtJ3V1B/Z+vuNqHc9jnKRsZhFVd/IqiLWxCGZBOSD/GKF/XxcCng4VYs1tJcXTxzRc5D+mvbZSElSp4GaCf+iglo94dD1jh84iIWy0KEs4NHVadzgPG0Pc7686ryEtR8xDzjEEnXOWqLlQ5F4p8n9xrj1uYxkBKlE65N/dElwWOsdgQ9KeRkwF9XMqP12FgJj3/334FzxNN0NmRCC5AfyjvpMdGSt+swzXn58/0w+n7tET9LTD4lFXdbg3IxKlKmtKenY0I5b7vIaAQ6U69m92oHpns8Fie+S9D9M2SK4vs6hkN3USdtQ7ITAkxVouOxLz3AF9ty5IRfFQN9UlMNEMC1JIU8SQZksmvpXaCAWxsb3g+WdUPe2glNqI4xlM4DQbDT66DBOIFEZPrPa8Hdy8mosCa5JweaEdeNH0jLGb33kgxDOas1zqHvNJXc/1Lk/DUYQDjEdIVYThvDOM/jsQegwq8JhTYyD2ILVgu1RM04x2p3Kqr19CjGPEQFNYbQwcM/YUpzMAnP8JS1YP2u7ZOOWcqksfpbTs2SbDsiG0aNzOx/ObLlSoQn/MJc7PODCH8ZhJ4ulJLxwT4zlvx54rvCqSeY7kefQaGZO1nEHPK0UopU7LjgjSeFByvGiEHi/Npvu802reOO4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199018)(83170400001)(38100700002)(38350700002)(8936002)(41300700001)(44832011)(2906002)(8676002)(66946007)(66476007)(66556008)(5660300002)(6916009)(52116002)(2616005)(6512007)(6506007)(83380400001)(26005)(186003)(1076003)(478600001)(316002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oEB0WatdpXX341gb8aOwZsER4tPKX277jMOwWmaiiWuIaf0STYcaBmaIC3RP?=
 =?us-ascii?Q?w8DlD1Dg2vg0UXSuun8wyWVywnXOHCpGNBhmfy9Cxtq9RsBu4cCywS2dVK3g?=
 =?us-ascii?Q?uSWLbdkuIAbLayPd3Fu4lxyQwPZ3Pjru6W9bRPU8JQCaF8OjR0/ngaDVrhkc?=
 =?us-ascii?Q?RpXx+wE5BwYHRQ/PcZ9qrneDeNgnM7z2pPJfR0EDpkHzSGRWh30dEXWru9L/?=
 =?us-ascii?Q?YJVjgCz518EVY3ar4Kb1OthsEq6Sef4+MeZwr2r9SvebozLbvWG6C9O+SkiQ?=
 =?us-ascii?Q?sJLOIuKROP/DNCgL0Ja4R0yJSHEqiED7VZLlOkXsUXVJhwizqjsbWVw8Qdhe?=
 =?us-ascii?Q?FwmFzd9c1Ig6bl+9gNzgXwLwZ4Aacw7x7OlGD0pjJsN2WcSQm6FoogUTkTdJ?=
 =?us-ascii?Q?ePv/RIJbS6xEtO8+Q+fF+En7QdNp3e0jfEee3O07TH+DpyYi5LayxcGFkS9I?=
 =?us-ascii?Q?xX9P05MT9iZZvJrnAjwOhdFSFW8Y0ibWbAkTIscylNDndwSy5fNnETUr74xF?=
 =?us-ascii?Q?RgefpkKBL2WSF2s57goyn/GVSats7d7yF627Jr0oT8zuJdsNlOVjU75OvSIk?=
 =?us-ascii?Q?+u8W0MFIAqjsp2oNzhRbIoMi7mR6TS1TKUNweCIMp7Xdc9Oi6g9RJZ2LFBBy?=
 =?us-ascii?Q?bl/lOvVhOkK7+wn3bhBeAEz6zaqFVxzJz8UP+QfFZhgAbiFlYKnSfgHYzrhx?=
 =?us-ascii?Q?8aPBRWpBDr4m2uAInPJHPfrf8YTtsh3sslVMozj89X4ZjZdcJBAzhT4Am4Ht?=
 =?us-ascii?Q?THufqIVGmkkVEiaB9BBNKDUkE9tpL4M926qsVMpe9xaOJReRTDpRddmmy16w?=
 =?us-ascii?Q?NT7Z0BN/JrOgIDddl2Kqi434xnfjsb+kvj0fxl+nCFiO3pbIHxNm87Imrpe9?=
 =?us-ascii?Q?83O9Sl1ABxTCEbElUiGjqQrp8x9w71S/g4eQRSlZYW7hMT3MQm5BJKiOmwyq?=
 =?us-ascii?Q?o3EDA4AoUAO+soCEVevU/f0eb7B+w3pMQJ9WYH4s6Tpz1HScVElzHcbzvtPF?=
 =?us-ascii?Q?FxgakCufJ0SuGR+m9nlCAHTaQ/GP1618cPyogGu/x9aJLwMgPisgL1Le7VJf?=
 =?us-ascii?Q?ht9Y71Tg05Z+KtAzjsHlKPhCkPlAer/R3EM0tU1tY/LfhQ4xamVuZKwc/c4+?=
 =?us-ascii?Q?1uoHuQlHR1sRob8fjRLp7gSRYJuPLEQxhqStkonFoJkegdkMosU57rOqjUID?=
 =?us-ascii?Q?EYk3vUvMIayccOGopT9TlIxiGNypswZ5O0OA9DF5i7FumNVnRWkiFghKQATJ?=
 =?us-ascii?Q?4HnV0mbKl0A2+JWuEZkFVqRzzhNpUtyAftgd3VUmjE4Xcr2vowr+csnnlz+s?=
 =?us-ascii?Q?UBeO25nj1MfPUcapcZuXzwFsz9PPCer+TAKGkM+PF3BVKFDKqsH+60Cc0Lz7?=
 =?us-ascii?Q?9S8SGGNBPAxk1+TGUimUqWSuXCXX6aDaKraY1iONUU/YmoY0S/NUmnqCfzKT?=
 =?us-ascii?Q?9GjUQXe2rqn4RKiCg5mc7vPIMOuZUKzmEMrHi6GGjzf+9a6r+lXaAQ9b1VIB?=
 =?us-ascii?Q?aK4wkAleq7wcnLKvW2hesDOrjzceQgBHm6L/H42RCSwCpoZ+/MlPstg09Xfq?=
 =?us-ascii?Q?5yuKX1LQUBf0p0pK3ifHtWZM3wqvyazjfzvaEc+mryl7l2DqFVcyQo67Mz1t?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19538bdb-5901-4c1b-e4fb-08db19fe161a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:38:48.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkGENkaC3o0Vcp3d3RvHkJvm+f+SVALdO6nyHHYR/TiwZo8vdoB7rmdpjAaUHxoZMDgbGxCFpGGIKgTgQYrAYf9vSHJTS3NTGY+CahntBdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-Proofpoint-GUID: DKeICVPh0crnfAbaVTcUWkVQfmb85-8i
X-Proofpoint-ORIG-GUID: DKeICVPh0crnfAbaVTcUWkVQfmb85-8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_19,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303010018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 02:38:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7908

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Hi Bruce,

Recently we found that the lxc ptest has lots of failure cases as below log-1, after checking the 
code, some cases failed due to related the init progess. For example, lxc-test-exit-code need to 
start container as daemon, but if using bash as init, the container cannot start correctly.

So added a busybox init utils checking in lxc-busybox template, if current system busybox contains 
init then use it, after applying this patch, the ptest result as log-2. 


######## 1og-1: ptest without patch #######

Starting LXC ptest ###
FAIL: lxc-test-api-reboot
SKIPPED: lxc-test-apparmor
PASS: lxc-test-apparmor-generated
FAIL: lxc-test-apparmor-mount
PASS: lxc-test-arch-parse
FAIL: lxc-test-attach
PASS: lxc-test-automount
FAIL: lxc-test-autostart
PASS: lxc-test-basic
FAIL: lxc-test-capabilities
FAIL: lxc-test-cgpath
PASS: lxc-test-checkpoint-restore
FAIL: lxc-test-cloneconfig
FAIL: lxc-test-clonetest
FAIL: lxc-test-concurrent
PASS: lxc-test-config-jump-table
FAIL: lxc-test-console
FAIL: lxc-test-console-log
FAIL: lxc-test-containertests
FAIL: lxc-test-createconfig
FAIL: lxc-test-createtest
PASS: lxc-test-criu-check-feature
FAIL: lxc-test-cve-2019-5736
FAIL: lxc-test-destroytest
FAIL: lxc-test-device-add-remove
FAIL: lxc-test-exit-code
FAIL: lxc-test-get_item
PASS: lxc-test-getkeys
PASS: lxc-test-list
PASS: lxc-test-locktests
FAIL: lxc-test-lxc-attach
PASS: lxc-test-lxcpath
PASS: lxc-test-may-control
FAIL: lxc-test-mount-injection
FAIL: lxc-test-no-new-privs
PASS: lxc-test-parse-config-file
FAIL: lxc-test-proc-pid
FAIL: lxc-test-procsys
PASS: lxc-test-raw-clone
PASS: lxc-test-reboot
FAIL: lxc-test-rootfs
FAIL: lxc-test-rootfs-options
FAIL: lxc-test-saveconfig
FAIL: lxc-test-share-ns
FAIL: lxc-test-shortlived
SKIPPED: lxc-test-shutdowntest
FAIL: lxc-test-snapdeps
FAIL: lxc-test-snapshot
FAIL: lxc-test-startone
SKIPPED: lxc-test-state-server
FAIL: lxc-test-symlink
FAIL: lxc-test-sys-mixed
FAIL: lxc-test-sysctls
FAIL: lxc-test-unpriv
FAIL: lxc-test-usernic
PASS: lxc-test-usernsexec
PASS: lxc-test-utils





Results:
    PASSED = 17
    FAILED = 37
    SKIPPED = 3
(for details check individual test log in ./logs directory)


###########log-2: ptest with patch ###################
root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest 
### Starting LXC ptest ###
PASS: lxc-test-api-reboot
SKIPPED: lxc-test-apparmor
PASS: lxc-test-apparmor-generated
FAIL: lxc-test-apparmor-mount
PASS: lxc-test-arch-parse
PASS: lxc-test-attach
PASS: lxc-test-automount
PASS: lxc-test-autostart
PASS: lxc-test-basic
PASS: lxc-test-capabilities
PASS: lxc-test-cgpath
PASS: lxc-test-checkpoint-restore
FAIL: lxc-test-cloneconfig
PASS: lxc-test-clonetest
PASS: lxc-test-concurrent
PASS: lxc-test-config-jump-table
PASS: lxc-test-console
PASS: lxc-test-console-log
PASS: lxc-test-containertests
PASS: lxc-test-createconfig
PASS: lxc-test-createtest
PASS: lxc-test-criu-check-feature
PASS: lxc-test-cve-2019-5736
PASS: lxc-test-destroytest
PASS: lxc-test-device-add-remove
PASS: lxc-test-exit-code
FAIL: lxc-test-get_item
PASS: lxc-test-getkeys
PASS: lxc-test-list
PASS: lxc-test-locktests
PASS: lxc-test-lxc-attach
PASS: lxc-test-lxcpath
PASS: lxc-test-may-control
PASS: lxc-test-mount-injection
FAIL: lxc-test-no-new-privs
PASS: lxc-test-parse-config-file
PASS: lxc-test-proc-pid
PASS: lxc-test-procsys
PASS: lxc-test-raw-clone
PASS: lxc-test-reboot
PASS: lxc-test-rootfs
PASS: lxc-test-rootfs-options
PASS: lxc-test-saveconfig
PASS: lxc-test-share-ns
PASS: lxc-test-shortlived
SKIPPED: lxc-test-shutdowntest
FAIL: lxc-test-snapdeps
PASS: lxc-test-snapshot
PASS: lxc-test-startone
SKIPPED: lxc-test-state-server
PASS: lxc-test-symlink
PASS: lxc-test-sys-mixed
PASS: lxc-test-sysctls
FAIL: lxc-test-unpriv
FAIL: lxc-test-usernic
PASS: lxc-test-usernsexec
PASS: lxc-test-utils

Results:
    PASSED = 47
    FAILED = 7
    SKIPPED = 3
(for details check individual test log in ./logs directory)




Xiangyu Chen (1):
  lxc: templates/lxc-busybox.in: if busybox contains init then use it

 ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch

-- 
2.34.1


