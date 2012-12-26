package com.formigone.webgl.client;

import com.formigone.webgl.resources.Res;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.resources.client.ExternalTextResource;
import com.google.gwt.resources.client.ResourceCallback;
import com.google.gwt.resources.client.ResourceException;
import com.google.gwt.resources.client.TextResource;
import com.google.gwt.user.client.DOM;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TabPanel;

public class Index implements EntryPoint {

	@Override
	public void onModuleLoad() {
		
		Image img = new Image(Res.R.tree());
		final Label frag = new Label();
		final Label vert = new Label();
		
		showShaderText(Res.R.simpleFragShader(), frag);
		showShaderText(Res.R.simpleVertShader(), vert);
		
		DOM.setElementAttribute(frag.getElement(), "white-space", "pre");
		DOM.setElementAttribute(vert.getElement(), "white-space", "pre");
		
		TabPanel shaders = new TabPanel();
		shaders.add(frag, "Fragment");
		shaders.add(vert, "Vertex");
		shaders.selectTab(0);

		RootPanel.get().add(img);
		RootPanel.get().add(shaders);
	}
	
	private void showShaderText(ExternalTextResource res, final Label el) {

		try {
			res.getText(new ResourceCallback<TextResource>() {
				
				@Override
				public void onSuccess(TextResource r) {
					el.setText(r.getText());
				}
				
				@Override
				public void onError(ResourceException e) {
					el.setText("Error getting resource");
				}
			});
		} catch (ResourceException e) {
			e.printStackTrace();
		}
	}
}
