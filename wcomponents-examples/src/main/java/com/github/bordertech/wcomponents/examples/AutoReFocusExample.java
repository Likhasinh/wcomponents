package com.github.bordertech.wcomponents.examples;

import com.github.bordertech.wcomponents.WAjaxControl;
import com.github.bordertech.wcomponents.WPanel;
import com.github.bordertech.wcomponents.layout.FlowLayout;
import com.github.bordertech.wcomponents.layout.FlowLayout.Alignment;

/**
 * This example demonstrates that focus will be returned to the control which triggered the form submit after a round
 * trip to the server completes.
 *
 * @author Martin Shevchenko
 * @since 1.0.0
 */
public class AutoReFocusExample extends WPanel {

	/**
	 * Creates an AutoReFocusExample.
	 */
	public AutoReFocusExample() {
		setLayout(new FlowLayout(Alignment.VERTICAL));

		add(new TextDuplicator());
		WDropdownSubmitOnChangeExample ddExample = new WDropdownSubmitOnChangeExample();
		add(ddExample);
		add(new WAjaxControl(ddExample.getStateSelector(), this));
		add(new WAjaxControl(ddExample.getRegionSelector(), this));
	}
}
