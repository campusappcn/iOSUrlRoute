# URL Route
UrlRoute makes popVC,pushVC,presentVC actions easier and more dynamically, while decoupling VC from VC.

### Feature

1. Manage all view-jumping actions in a plist together, which makes changing routes more easier and routes can even be changed dynamically by server.
2. Allow sending messages to next VC and callback to the pop VC.
3. Can set a view for any error actions for the view-jumping.
4. Launch your app via some scheme from a browser, or some other apps.


#### Feature in newFeature Branch
1. Add Method for change tabBar
2. Support just creating `UIViewController` for doing more thing


### How To Add To Project

#### method 1
just push the folder `UrlRoute` to you project.

#### method 2
use `cocoapods`.put the code into your podfile 

````
pod 'iOSUrlRoute', :git => 'https://github.com/campusappcn/iOSUrlRoute.git', :tag => 'newFeature-1.0'

````


### Usage

1. The window rootView must be `UINavigationController`

```` objectivec
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;

````

2. ~~All the viewController must be `CurrentViewController`'s child VC.~~ this is now fixed,using category of `UIViewController`.

3. Setup your personal url map in `SDCUrlRouteConfig.h`, `SDCUrlRouteFile.plist`

4. Complete all the steps above. You can try it, like this:

```` objectivec
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    switch (indexPath.row) {
        case 0:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES];
        }
            break;
        case 1:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent];
        }
            break;
        case 2:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict];
        }
            break;
        case 3:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test2",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict];
        }
            break;
        case 4:
        {
            [[SDCUrlRouteCenter sharedCenter]open:@"http://www.baidu.com" animated:YES];
        }
            break;
        case 5:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES extraParams:dict WithReloadBlock:^(id customValue) {

                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];

            }];

        }
            break;
        case 6:
        {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"hello Test1 Call Back",@"key", nil];

            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(RouteToTestVC) animated:YES URLRedirectType:kUrlRedirectPresent extraParams:dict WithReloadBlock:^(id customValue) {

                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:customValue delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];

            }];
        }
            break;
        case 7:
        {
            [[SDCUrlRouteCenter sharedCenter]open:localRouteUrl(@"helloworld") animated:YES];
        }
            break;
        default:
            break;
    }
}

````



